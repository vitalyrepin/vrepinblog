---
layout: post
title: "Copyrighted monuments in Finland. Why Finnish works of art are not widely represented in Wikipedia"
comments: true
thumbnail: Tapio_Rautavaara.jpg
summary: Status of the Panorama Freedom in Finland. How to contribute photos of Finnish monuments to Wikipedia, practical guide. If current legislation lowers visibility of Finnish sculptural art, why not to change it?
tags: [Finland,IPR,copyright,photo]
---

# What are you talking about?

<img alt="Monument to Tapio Rautavaara in Åggelby (Oulunkylä)" src="{{site.baseurl}}/public/images/Tapio_Rautavaara.jpg" width="50%" align="left" style="margin: 0px 15px">
It can be a huge surprise for most of Finns but a lot of statues and monuments installed in public places in Finland are copyrighted.
Unfortunately this is not only a curious fact. It has serious affect on the rights to publish photos of these works of art.

I have recently faced this problem when I shot a photo of the beautiful [Tapio Rautavaara's statue](https://fi.wikipedia.org/wiki/Tapio_Rautavaara#/media/File:Monument_to_Tapio_Rautavaara_in_%C3%85ggelby_%28Oulunkyl%C3%A4%29_1.jpg) installed in Åggelby in the capital area and uploaded it
to [Wikimedia Commons](https://commons.wikimedia.org/wiki/Main_Page) (this repository hosts most of the images used in Wikipedia articles).
My contribution was almost immediately marked for deletion. In fact,
Wikimedia has a lot of [deletion requests based on the same reason](https://commons.wikimedia.org/wiki/Category:FOP-related_deletion_requests).

This was a surprise and pushed me to investigate the situation deeper. At the end, I managed to find a way to publish my photo in Finnish Wikipedia (but not in Wikimedia).

I hope my findings can be useful for others facing similar issues in Finland and other countries which lack "freedom of panorama". Besides all, it is a good illustration that even Europe
is still on the way to a [free digital society](http://digitalfree.info/FreeDigitalSociety/index.html).

This article is written in English because it's content (as I believe) can be beneficial for the foreigners who visited Finland and want to contribute their photos to Wikipedia.

<!--break-->

# Copyrighted monuments. What is this?

Copyright length for statues in Finland is 70 years from the authors death. It means the statue is free from copyright in Finland if the author is died before 1945.
Statue is free from copyright in both US and Finland if the author is died before 1926 OR if the author is died before 1945 and if the statue is published before 1923.

So, if the monument is free from copyright in both US and Finland you can make its photo and upload it to Wikimedia without any difficulties.

But what to do if it is not free from copyright? Is it possible to upload them to Wikimedia? No, not at all. Is it possible to upload them to Wikipedia? The answer is — it depends.
Sometimes yes, sometimes no and always depends on the rules for specific Wikipedia project (I will clarify what does "Wikipedia project" mean further).

# No Freedom of Panorama for artistic works in Finland

First we need to understand the root of the problem which sits in the Finnish legislation system.

Quoting [Wikipedia article on the matter](https://en.wikipedia.org/wiki/Freedom_of_panorama):

> Freedom of Panorama is a provision in the copyright laws of various jurisdictions that permits taking photographs and video footage
> and creating other images (such as paintings) of buildings and sometimes sculptures and other art works which are permanently located in a public place, without infringing on any
> copyright that may otherwise subsist in such works, and to publishing such images. It is an exception to the normal rule that the copyright owner has the exclusive right to
> authorize the creation and distribution of derivative works.

The image below is taken from Swedish Wikipedia and its shows the status of this Freedom in different countries:

<a title="By Mardus [CC BY-SA 3.0 (http://creativecommons.org/licenses/by-sa/3.0)], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File%3AFreedom_of_Panorama_world_map.png"><img width="100%" alt="Freedom of Panorama world map" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Freedom_of_Panorama_world_map.png/512px-Freedom_of_Panorama_world_map.png"/></a>

Finland is shown in yellow color which means that freedom is given to the buildings only. More details can be found in the
corresponding [Wikimedia article](https://commons.wikimedia.org/wiki/Commons:Freedom_of_panorama#Finland).

# What can I publish in Wikimedia?

WARNING to the web surfer: This section is applicable only to Finland!

## Statues
If the statue is free from copyright (see the conditions in the first section), it's completely OK to publish its image in Wikimedia.
If it is not copyright-free, you simply are not allowed to do it. The reason is that the images published in Wikimedia can be used for  commercial purposes. And Finnish law does not grant
this right for the copyrighted works of art.

## Buildings
It's completely OK to publish images of buildings in Wikimedia.

# What and how can I publish in Wikipedia?

## What?
First, we need to understand that there are several Wikipedias. E.g., Finnish Wikipedia, Swedish Wikipedia and English Wikipedia are different projects which might have different policy towards
publishing non-free works. This is why it is always easier to publish in Wikimedia which is the common multimedia repository used by all the Wikipedia projects.

Status of non-free content for different wikis is summarized [here](https://meta.wikimedia.org/wiki/Non-free_content). For Finland it is:

> Non-free images or music samples are allowed if 1) they are not replaceable by free content considering the purpose which they are serving in the article and
> 2) they are used in accordance with the quotation right of the Finnish copyright law. Historically significant non-free images are forbidden, as they could be replaced.
> Also non-free images of living people are forbidden.

## How?

To upload your image to Finnish Wikipedia you need to use [toiminnot:Tallenna](https://fi.wikipedia.org/wiki/Toiminnot:Tallenna) template and fill the following information:

```
{% raw %}
{{Tiedoston tiedot
| Kuvaus = Title of the work. It's a good practice to include here also the name of the author (sculptor) and creation year.
| Lähde = Own work
| Päiväys = Date when the photo was taken
| Tekijä = You
}}

{{Taideteos|name of the article where picture is used|{{oma|cc-by-3.0}} }}
{% endraw %}
```
You can check [Tapio Rautavaara's monument page](https://fi.wikipedia.org/wiki/Tiedosto:Monument_to_Tapio_Rautavaara_in_%C3%85ggelby_%28Oulunkyl%C3%A4%29_1.jpg) as an example:

```
{% raw %}
== Yhteenveto ==
{{Tiedoston tiedot
| Kuvaus = Monument of Tapio Rautavaara / ''Kulkurin uni'' in Oulunkylä (Åggelby). Monument is made by [[Veikko Myller]] (2000).
| Lähde = Own work
| Päiväys = 2 September 2015
| Tekijä = [[user:Vitaly repin]] (photograph)
| Tekijänoikeuksien haltija =
}}

== Käyttöoikeus ==
{{Taideteos|Tapio_Rautavaara|{{oma|cc-by-3.0}} }}
{% endraw %}
```


In order to use this image from a (Finnish) Wikipedia article you need to insert this code into the article:

```
[[Tiedosto:File_name|thumb|Caption]]
```

Example:

```
[[Tiedosto:Monument to Tapio Rautavaara in Åggelby (Oulunkylä)_1.jpg|thumb|Veikko Myller, ''Tapio Rautavaaran muistomerkki / Kulkurin uni'', 2000, Oulunkylän torilla.]]
```

It's important to understand that you can't use the image from Finnish Wikipedia in other Wikipedias (e.g., English). You will need to upload an image there as well.

# Can't we change the legislation?

As you see, it is not always impossible to share the Finnish work of art you liked through Wikipedia. But it is not that simple and requires certain level of motivation.

I am interested to know which benefits current legislation brings to the Finnish economy and recognition of the Finnish culture around the globe. As of now, I see only drawbacks
of the current system:

- Less visibility of the Finnish works of art in Wikipedia
- Complexities with promotion of Finnish cultural heritage through  campaigns like ["Wiki Loves Monuments"](http://www.wikilovesmonuments.org/)
or ["Wiki Loves Public Art"](https://commons.wikimedia.org/wiki/Commons:Wiki_Loves_Public_Art_2013). The scope of such campaigns shall be limited to non-copyrighted monuments and buildings

I personally much more like the legislation in our neighboring country of Sweden where sculptures and 3D art are covered by Freedom of Panorama.
May be it's something for [Finnish Pirate Party](https://en.wikipedia.org/wiki/Pirate_Party_of_Finland) and
[SFP/RKP](https://en.wikipedia.org/wiki/Swedish_People's_Party_of_Finland) to look into? It's not always a bad idea to copy Swedish
ways of doing things to Finland :-)

P.S. It's pity I didn't know about this problem while preparing [Stallman's course about the free digital society](http://digitalfree.info/). This is a really good example of copyright in action
in the modern world.

