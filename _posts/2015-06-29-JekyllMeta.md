---
layout: post
title: "Jekyll: how to add metadata to your site"
comments: true
summary: "How to add metadata to the Jekyll-based site: google sitemap xml, Open Graph and plain old meta-tags."
thumbnail: me_bike_large.jpg
tags: [jekyll,blogging,facebook,metadata]
---

You've created web site with Jekyll and are trying to post links to the social network of your choice.  Oops! No summary appears under your link!
The reason is that the service needs metadata for the page.

> Meta data helps in a lot of ways. Sharing in social networks is just one example. Don't think that if you do not use social networks, your web site does not need meta data.

I will summarize important meta tags and the ways to add them to Jekyll-based site.  If you have something to add &mdash; don't hesitate and leave your feedback in the comments, pls!

<!--break-->

## Classics: HTML meta tags

Meta tags *description* and *keywords* can be generated from your post YAML front matter. Add these lines to your template (*_includes/head.html* in my theme):

{% highlight liquid %}
{% raw %}
{% if page.summary %}
<meta name="description" content="{{ page.summary | escape }}">
{% endif %}
{%if page.tags %}
<meta name="keywords" content="{{ page.tags | join: ', ' | escape }}"/>
{%endif %}
{% endraw %}
{% endhighlight %}

If fields *tags* and *summary* are set for the page, they appear in the generated HTML meta data. Pay attention to the way *tags* are set &mdash; it's an array.
[Read more about tagging practices in Jekyll.]({{site.baseurl}}{% post_url 2015-06-24-Tagging %})

YAML front matter example:

{% highlight yaml %}
summary: How to add metadata to the Jekyll-based site: google sitemap xml, Open Graph and plain old "meta"-tags.
tags: [jekyll,blogging,facebook,metadata]
{% endhighlight %}


## Search engines: sitemap

[Sitemap](https://en.wikipedia.org/wiki/Sitemaps) makes it easier for search engine to index your site.
[Jekyll Sitemap Generator Plugin](https://github.com/jekyll/jekyll-sitemap) creates sitemap. Just follow its installation instructions.

Don't forget to register your sitemap with search engines. [How to submit a sitemap to Google](https://support.google.com/sites/answer/100283?hl=en).

## Open Graph metadata

[Open Graph protocol](http://en.wikipedia.org/wiki/Facebook_Platform#Open_Graph_protocol) enables integration of web pages into the social graph. This protocol was originally
developed for Facebook but [it is used by variety of services](http://stackoverflow.com/questions/10397510/do-services-other-than-facebook-use-open-graph) now.

It makes a lot of sense to add its meta tags into your web pages.

An article [Integrating Facebook Open Graph Meta Tags In Jekyll](http://danyalzia.com/2015/03/25/integrating-facebook-open-graph-in-jekyll/) gives detailed instructions on integration process.
You can also take a look into [my blog sources](https://github.com/vitalyrepin/vrepinblog/blob/master/_includes/head.html) for more examples. Pay special attention to the *escape* filter which
is needed to handle quotes properly.
