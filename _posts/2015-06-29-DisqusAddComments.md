---
layout: post
title: "Blog comments = Disqus + Jekyll"
comments: true
summary: How to add Disqus comments to you Jekyll blog. Useful disqus variables.
tags: [disqus,jekyll,blogging]
---


Jekyll and Disqus integration steps are described in [Joshua Lande's post](http://joshualande.com/jekyll-github-pages-poole/).


However it is better to get a little bit deeper and set [Disqus configuration variables](https://help.disqus.com/customer/portal/articles/472098-javascript-configuration-variables).

It's pretty simple and straightforward.  Quote from my [layout](https://github.com/vitalyrepin/vrepinblog/blob/master/_layouts/default.html):

{% highlight javascript %}
{% raw %}
var disqus_shortname = 'vitalyrepinblog';
{% unless page.gamla_disqus_satte %}
    var disqus_identifier = '{{ page.id | escape }}';
    var disqus_title = '{{ page.title | escape }}';
    var disqus_url = '{{site.url}}{{site.baseurl}}{{ page.url }}';
{% endunless %}
{% endraw %}
{% endhighlight %}

Variable *gamla_disqus_satte* is needed for the old-style Disqus comments (integrated without setting variables other than *disqus_shortname*) not to be lost. It is set in the post's YAML frontmatter.

{% include twitter_plug.html %}
