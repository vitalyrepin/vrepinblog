---
layout: post
title: How to incorporate external utility scripts into Logstash Pipeline
comments: true
lang: en
thumbnail: hackergotchi_big.png
summary: This article describes the approach to call external applications from Logstash Pipeline and use their (JSON/XML/key-value) output in the further filtering process.
tags: [logstash,elasticsearch,ruby]
---

### Overview

[Logstash](https://www.elastic.co/products/logstash) is a great tool to process the logs and extract valuable data from them. There are many useful Logstash
[filter plugins](https://www.elastic.co/guide/en/logstash/current/filter-plugins.html) which make it easy to process the raw log data. However, sometimes
external utilities are required to process the data in a more complicated way than existing filter plugins can.

It's possible to [code your own filter plugin](https://www.elastic.co/guide/en/logstash/current/_how_to_write_a_logstash_filter_plugin.html) in Ruby
but what to do if you already have the filter implemented in some other programming language and want to reuse it in Logstash?

In this case it's easier to communicate with this external filter from Logstash. This article demonstrates the simplest way of incorporating external
applications into the Logstash pipeline:

1. Logstash launches external program and delivers the input data to it through command line arguments and stdin
1. External program writes results to stdout in any format understood by Logstash filters (e.g., JSON)
1. Logstash parses output of the external program and continues to handle it in the pipeline

It's needless to say that it is not the very best approach in terms of performance.
E.g., if startup time of the external application is significant, you may consider
to launch this application once (as a daemon/service) and communicate with it using [ØMQ](http://en.wikipedia.org/wiki/%C3%98MQ) or other high-performance message queue.

Detailed explanation and usage example are stated below.

<!--break-->

## Launching external program

We will use [ruby filter](https://www.elastic.co/guide/en/logstash/current/plugins-filters-ruby.html) in order to launch external application and capture its output:

{% highlight ruby %}
filter {
    # <...> <- More filters are above
    # Launching external script to make a deeper text analysis
    if [file_path] =~ /.+/ {
       ruby {
          code => 'require "open3"
                   body_path = event["file_path"]
                   cmd =  "/opt/bin/my_filter.py -f #{file_path}"
                   stdin, stdout, stderr = Open3.popen3(cmd)
                   event["process_result"] = stdout.read
                   err = stderr.read
                   if err.to_s.empty?
                     filter_matched(event)
                   else
                     event["ext_script_err_msg"] = err
                   end'
          remove_field => ["file_path"]
       }
    }
    # Parsing of the process_result is here (see the next section)
 }
{% endhighlight %}

Note:

+ External application ```/opt/bin/my_filter.py``` is launched only if ```file_path``` field is not empty.  This field shall be extracted earlier in the filter pipeline. It's value (```#{file_path}```) is used in
the command line to launch external filter.
+ stdin handle is accessible for our tiny ruby script and it can be used to send more data to the external program (```/opt/bin/my_filter.py```).
+ If application stderr is not empty, filter is not considered to be successful and stderr content is recorded into ```ext_script_err_msg``` field.
+ If processing was successful,  output of the external program is recorded into ```process_result``` filed and ```file_path``` field is removed

### Parsing output of the external program (JSON)

The easiest way to deliver the data back to Logstash is to use one of the structured data formats understood by Logstash filters: [JSON](https://www.elastic.co/guide/en/logstash/current/plugins-filters-json.html),
[XML](https://www.elastic.co/guide/en/logstash/current/plugins-filters-xml.html) or more old-fashioned [key-value (kv)](https://www.elastic.co/guide/en/logstash/current/plugins-filters-kv.html).


Example with JSON:

{% highlight ruby %}
  if [process_result] =~ /.+/ {
       json {
          source => "process_result"
          remove_field => [ "process_result" ]
       }
    }
{% endhighlight %}

Note:

+ Field ```process_result``` holds the output of the external application and is supposed to be in JSON format.
+ If parsing was successful JSON fields are becoming event fields and intermediate field ```process_result``` is removed.

### Several words about exec output plugin

If you only need to launch external utility upon any matched Logstash event, you may consider to use simpler approach
– [exec output plugin](https://www.elastic.co/guide/en/logstash/current/plugins-outputs-exec.html).

{% include twitter_plug.html %}

