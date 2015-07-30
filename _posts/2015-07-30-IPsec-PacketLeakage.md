---
layout: post
title: "[ipsec, iptables, ebtables] How to avoid leakage of packets addressed to/from private IP space"
comments: true
summary: "This article describes Castle Approach to filtering IP packets addressed to/from private IP space. iptables and ebtables firewall tools are used. Keywords: ipsec, BCP38, iptables, ebtables, linux"
tags: [vpn,firewall,ebtables,iptables,linux]
---

# Background

Several months ago I've been asked by [SEED4.ME VPN](https://seed4.me/) to investigate the package leakaging issue in their environment raised after delivering new VPN features for Apple devices.

We've agreed that we do want not only to solve this particular problem with Apple IPsec, but
*to build a fence system which can completely eliminate any packet leaking problems in future caused by any bug, feature, misconfiguration etc.*

I hope results of this small project can be useful for other engineers facing similar challenges.

# Problem: packet leakage

Packets belonging to [private IP address space](http://en.wikipedia.org/wiki/Private_network) shall not appear in the network interfaces which do not belong to private networks.

Typical example is VPS hosted in the cloud. If it sends packets addressed to private IP address space through its external NIC, it usually means that something wrong is happening.
More providers started to implement [BCP38](http://www.bcp38.info/index.php/Main_Page) RFC for defeating  Denial of Service Attacks which employ IP Source Address Spoofing.
They block such packets and complain to VPS administrators.

However, [*errare humanum est*](http://en.wikipedia.org/wiki/List_of_Latin_phrases_%28E%29#errare_humanum_est) &mdash; administrators are people too. Typical cases are [NAT](http://www.smythies.com/~doug/network/iptables_notes/index.html)- and [IPsec](http://marc.info/?l=netfilter&m=143654558816715&w=2)-related.

This article describes [Castle Approach](https://en.wikipedia.org/wiki/Defense_in_depth_%28computing%29) to this problem. An idea is simple:

1. Leaked packets are filtered by Linux firewall (netfilter iptables)
1. If packets are not filtered by Linux firewall, they are filtered by Linux ethernet bridging firewall (netfilter ebtables). In the same time, they are logged and became visible to the monitoring system

Ebtables is used as last line of defense. It has additional benefit &mdash; usually ebtables rules are simple (if they even exist!) and iptables rules can be very complex, managed with sophisticated tools etc. As a result, it's much easier to make a mistake managing iptables than ebtables [^1].

<!--break-->

# IPsec: dropping packets without a matched policy

Create a drop rule in filter FORWARD, that drops incoming packets for SNATed IPs without a matching policy: [^2]

```
iptables -A FORWARD -d <src> -m policy --pol none --dir out -j DROP
```

```<src>``` is your IPSEC VPN network. E.g., ```10.57.0.0/16```.

This is our first line of defense. Don't forget to test that it really works (e.g., by adding logging)!

This step really depends on your networking configuration. Example above is valid for IPsec VPN implementation based on [xfrm](http://man7.org/linux/man-pages/man8/ip-xfrm.8.html).

# Ebtables as last line of defense


[ebtables](http://ebtables.netfilter.org/)  is a filtering tool for a Linux-based bridging firewall. It works in the link layer.

We will use it to log and drop unwanted packets. Presence of ebtables logs is a signal to administrator that something wrong has happened &mdash; packets were not filtered in the higher layers
and reached link layer.

## Filtering by IP with ebtables: goal setting

Our goal is to drop all the packets addressed to private networks from your external network interface. Filtering mechanism should also support exceptions. In other words, it shall be possible
to allow packets addressed to certain (exceptional) private networks to flow through external network interface.

We will suppose that your network interface is called eth0.

## Step 1: Enable network bridge functionality

ebtools works with network bridges. It means we need to have one. First, make sure your kernel supports network bridges. Set "networking -> 802.1d Ethernet Bridging" to either yes or module.


Second, make sure you have [bridge-utils](http://sourceforge.net/projects/bridge/files/bridge/) installed. If they are not, install them. The command for Ubuntu:

```
apt-get install bridge-utils
```

Check that bridge can be created:

```
# brctl addbr br0
# brctl show
```
``br0`` shall be shown in the output of the last command.

## Step 2: Enable ebtables filtering
Make sure [your kernel supports ethernet bridge tables functionality](http://ebtables.netfilter.org/misc/ebtables-faq.html#quiz1).

Then install ebtables utility. Installation command for Ubuntu:

```
apt-get install ebtables
```

Check that command line ```ebtables -L``` shows you an empty output for all three chains &mdash; *FORWARD, OUTPUT* and *INPUT*.
## Step 3: Create a bridge and add physical network interface to it

We need to have a bridge with only one network card connected (eth0). It means that you need to configure bridge IP address to be the same as it is currently set for your NIC. And change routing.

It is done through network interfaces configuration.

E.g., in Ubuntu you need to change ```/etc/network/interfaces``` file in the following manner:

```
auto br0

iface eth0 inet manual
up ip link set eth0 up
up ip link set dev eth0 promisc on

down ip link set eth0 promisc off
down ip link set eth0 down

# The local network bridge
iface br0 inet static
  bridge_ports eth0
  bridge_stp off       # disable Spanning Tree Protocol
  bridge_waitport 0    # no delay before a port becomes available
  bridge_fd 0          # no forwarding delay
  address <IP address of your host>
  netmask <netmask of your host>
  gateway <default gateway>
  metric 1
  post-up ip link set dev br0 promisc on
  post-up /usr/local/bin/ebtables-filter.sh br0
  post-down ebtables -F
```

Most of the parameters are obvious. Several comments:

- We set [promiscuous mode](https://en.wikipedia.org/wiki/Promiscuous_mode) for ```eth0``` and ```br0```. This mode is activated after bringing the interfaces up.  This step seems to be
unnecessary in the recent kernels (4.1.0 and later).
- Filtering is activated by the script ```ebtables-filter.sh``` which is launched after bridge interface came up.


## Step 4: Filtering

Filtering script ```/usr/local/bin/ebtables-filter.sh``` is relatively simple:

{% highlight shell %}
#!/bin/sh


# Bridge interface to add rules for. Typically br0
IFACE=br0

# Networks to block: private addresses as defined in RFC 1918
BLK_ADDR="10.0.0.0/8 172.16.0.0/12 192.168.0.0/16"

# Private networks to NOT block: e.g. they are used to connect to the VPN console
UNBLK_ADDR="192.168.2.0/24"

# First - adding exceptions
for addr in $UNBLK_ADDR; do
  ebtables -A OUTPUT -p IPv4 --ip-destination $addr  -j ACCEPT
  ebtables -A FORWARD -i $IFACE -p IPv4 --ip-destination $addr  -j ACCEPT
  ebtables -A OUTPUT -p IPv4 --ip-source $addr -j ACCEPT
  ebtables -A FORWARD -i $IFACE -p IPv4 --ip-source $addr -j ACCEPT
done

# Second - adding blocked networks
for addr in $BLK_ADDR; do
  # Log leaks
  ebtables -A OUTPUT  -p IPv4 --ip-destination $addr  --log-level info --log-ip --log-prefix "EBTABLES-BLKO"
  ebtables -A FORWARD -i $IFACE -p IPv4 --ip-destination $addr  --log-level info --log-ip --log-prefix "EBTABLES-BLKF"
  ebtables -A OUTPUT  -p IPv4 --ip-source $addr  --log-level info --log-ip --log-prefix "EBTABLES-BLKO"
  ebtables -A FORWARD -i $IFACE -p IPv4 --ip-source $addr  --log-level info --log-ip --log-prefix "EBTABLES-BLKF"

  # Drop leaks
  ebtables -A OUTPUT -p IPv4 --ip-destination $addr  -j DROP
  ebtables -A FORWARD -i $IFACE -p IPv4 --ip-destination $addr  -j DROP
  ebtables -A OUTPUT -p IPv4 --ip-source $addr -j DROP
  ebtables -A FORWARD -i $IFACE -p IPv4 --ip-source $addr -j DROP
done
{% endhighlight %}

It instructs ebtables to drop all packets which are coming from or addressed to private networks. In order to support exceptions we set acceptance rules in the beginning &mdash;
the packets which are coming from or to these networks will not be dropped. Every chain has a different logging prefix which makes it easier for the reader of log files to understand
where the packet was caught.

## Step 5: Test your setup

We are done. Now it's time to test your setup. If any packet is dropped, it is also logged into you logging system (the same way iptables logs their packets if requested to do so)
and you can easily monitor these logs in your network monitoring platform.

If you have any questions, comments, improvements ideas, don't hesitate to comment under this post!

[^1]: Ebtables and iptables are userland utilities to manage Linux kernel firewall, they are NOT filtering anything by themselves. This article uses "ebtables" as a synonym to "Linux-based bridging firewall". "iptables" is used in a similar manner.
[^2]: Adapted from [Noel Kuntze's post](http://marc.info/?l=netfilter&m=143654576916745&w=2).


{% include twitter_plug.html %}
