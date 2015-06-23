---
layout: post
title: "Enabling comments: Jekyll and Disqus integration"
comments: true
summary: How to add Disqus comments to you Jekyll blog. Useful disqus variables.
tags: [disqus,jekyll,blogging]
---


Jekyll and Disqus integration steps are described in [Joshua Lande's post](http://joshualande.com/jekyll-github-pages-poole/).


However it is better to get a little bit deeper and set [Disqus configuration variables](https://help.disqus.com/customer/portal/articles/472098-javascript-configuration-variables).

It's pretty simple and straightforward.  Quote from my [layout](https://github.com/vitalyrepin/vrepinblog/blob/master/_layouts/default.html):

{% highlight javascript %}
{% raw %}
var disqus_identifier = "{{ page.id }}";
var disqus_title = '{{ page.title }}';
var disqus_url = '{{site.url}}{{site.baseurl}}{{page.url}}';
{% endraw %}
{% endhighlight %}

{% include twitter_plug.html %}
