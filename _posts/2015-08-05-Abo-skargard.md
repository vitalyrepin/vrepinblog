---
layout: post
title: "Åbo omnejd. Skärgårdens ringväg med cykel / Saariston Rengastie"
thumbnail: TurkuArchipelago.png
comments: true
lang: sv
locale: sv_SE
geomap: true
summary: På skärgårdens ringväg med cykel. Rutter, planering, sevärdheter, foton. Vänta inte, njut av naturliga och kulturella skönheter nu!
tags: [cycling,Finland,skärgården]
---

{% capture mapid %}map{{page.id | md5}}{% endcapture %}

<style type="text/css">
     #{{ mapid }} {
     width:100%;
     height:550px;
     background-color: white;
   }
  </style>

<div id="{{ mapid }}">

</div>

<script>
  var map = L.map('{{ mapid }}', {
    fullscreenControl: true
  }).setView([60.162818, 21.56339], 14);

  var track = new L.GeoJSON.AJAX("{{site.baseurl}}/public/gpx/aboskargard.json", { style: {color: '#4B0082', weight: 4, opacity: 1}});
  var tileUrl = 'http://{s}.tile.thunderforest.com/cycle/{z}/{x}/{y}.png',
  layer = new L.TileLayer(tileUrl, {maxZoom: 18, attribution: 'Tiles courtesy of <a href="http://www.thunderforest.com/opencyclemap/" target="_blank">OpenCycleMap</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'});
map.addLayer(layer);

       var locArr = [[60.16281800000001, 21.56339200000002],
                     [60.39858,21.384533000000033],
		     [60.19360500000001,21.908028999999942],
		     [60.376961,21.942023999999947],
		     [60.47112400000001,22.01547000000005],
		     [60.54414190000001,21.354319000000036],
		     [60.5711454,21.831106999999975],
		     [60.570192999999996,21.863696000000004],
		     [60.5631733, 21.6078634],
		     [60.4072845, 22.4739652],
	    	     [60.452443800000005,22.278552499999932]
		    ];

       var descArr = ["<a href='https://sv.wikipedia.org/wiki/Korpo_kyrka' target='_blank'>Korpo kyrka</a>",
                      "<a href='http://www.saaristonrengastie.fi/sv/content/inio-kyrka-sophia-wilhelmina' target='_blank'>Iniö kyrka</a>",
		      "<a href='https://sv.wikipedia.org/wiki/Nagu_kyrka' target='_blank'>Nagu kyrka</a>",
		      "<a href='https://sv.wikipedia.org/wiki/Rimito_kyrka' target='_blank'>Rimito kyrka</a>",
		      "<a href='https://sv.wikipedia.org/wiki/N%C3%A5dendals_kloster' target='_blank'>Nådendals kloster</a>",
		      "<a href='http://visitkustavi.fi/index.php?option=com_content&view=article&id=419:den-korsbyggda-tr%C3%A4kyrkan-och-kyrkog%C3%A5rden-i-gustavs&catid=188&Itemid=932&lang=sv' target='_blank'>Träkyrkan i Gustavs</a><br>" ,
		      "<a href='http://www.kansallismuseo.fi/sv/villnas-slott' target='_blank'>Villnäs slott</a>",
		      "<a href='https://sv.wikipedia.org/wiki/Villn%C3%A4s' target='_blank'>Villnäs kyrka</a>",
		      "<a href='http://www.saaristonrengastie.fi/sv/content/tovsala-heliga-korsets-kyrka' target='_blank'>Tövsala kyrka</a>",
		      "<a href='https://sv.wikipedia.org/wiki/Kust%C3%B6_biskopsborg' target='_blank'>Kustö biskopsborg</a>",
		      "<a href='https://sv.wikipedia.org/wiki/%C3%85bo_domkyrka' target='_blank'>Åbo domkyrka</a>"
		      ];

       map.fitBounds(locArr);

       for (var i = 0; i < descArr.length; i++) {
          L.marker(locArr[i]).addTo(map).bindPopup(descArr[i]).openPopup();
       };

      track.addTo(map);
</script>

# Vad är skärgårdens ringväg egentligen?

<a data-flickr-embed="true" href="https://www.flickr.com/photos/vitalyrepin/7732946682/in/album-72157630932242066/" title="Vägen till Rödilä"><img src="https://farm9.staticflickr.com/8288/7732946682_dcbf3e5aef_c.jpg" width="100%" height="100%" alt="Vägen till Rödilä"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Åbolands skärgård ligger i skärgårdshavet nära Åbo. Skärgårdens ringväg slingrar sig mellan olika härliga holmar och öar med underbara utsikter.  Broar och små färjor
anknyter öar och kusten. Skärgården har varit bebodd mera än 3000 år. Därför finns det också intressanta historiska sevärdheter där.

Åland är nära och det är möjligt att kombinera cykelfärder till Åland och skärgården. Egentligen i fjol cyklade jag [från Åbo till Stockholm genom Åbolands skärgård och Åland](http://www.everytrail.com/view_trip.php?trip_id=2965087). Det var underbar upplevelse.

<!--break-->

Det finns två resrutter med samma namn &mdash; Skärgårdens Ringväg (Saariston Rengastie på finska). Den första är [Lilla Ringvägen](http://saaristonrengastie.fi/sv/content/lilla-ringvagen). Den andra är den riktiga [skärgårdens ringväg](http://saaristonrengastie.fi/sv/content/ruttbeskrivning). Första resrutten är kortare än andra och det är lätt att cykla över den rutten på bara en dag.

Det är lätt att nå Åbo och resa bort från den staden.  Åbo är den gamla huvudstaden och det är välkopplat med hela landet genom buss, tåg och flygplan. T.ex., jag behövde åka från Åbo till Helsingfors kl. 3 på natten och jag gjorde det med hjälp av buss utan några vedermödor.

Vilken säsong är bäst för ett besök? Jag föredrar sommar och höst. Hösten är skön men det är svårare att flytta sig med färjorna på hösten än på sommaren eftersom ett färre antal båtar fungerar på hösten.

# Vilken resrutt är bäst?

<a data-flickr-embed="true" href="https://www.flickr.com/photos/vitalyrepin/7774819992/in/album-72157630932242066/" title="Kor på Åbolands skärgård"><img src="https://farm8.staticflickr.com/7270/7774819992_22b87589a8_c.jpg" width="100%" height="100%" alt="Kor på Åbolands skärgård"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Det hänger på en tid som du har och på dina preferenser. Det är fullkomligt möjligt att cykla någon rutt på bara en dag. Men du ska inte ha en tid att bekanta dig med alla sevärdheter på vägen.

Om du vill besöka sevärdheter det är bättre att cykla på lilla ringvägen på  en dag eller cykla på den sedvanliga ringvägen i en två eller även tre dagar. Om du vill bara cykla och njuta av natur och vägen, cykla på lilla ringvägen med terrängcykel eller på verklig ringvägen med racercykel.

Jag tror du ska inte vara besviken om du cykla genom skärgården ringväg &mdash; antingen lilla eller sedvanlig. Oavsett vilken rutt du väljer, är det viktigt att planera din färd. Den viktigaste plandelen är färjetidtabeller. Om du felar där, kan du låsa dig på en ö utan någon möjlighet att fortsätta din färd den där dagen.

# Planering: GPS rutter, färjetidtabeller, bussar, tåg och vandrarhem

<a data-flickr-embed="true" href="https://www.flickr.com/photos/vitalyrepin/7718856014/in/album-72157630932242066/" title="Färjan från Hanka till Nagu"><img src="https://farm9.staticflickr.com/8430/7718856014_5fafc42503_c.jpg" width="100%" height="100%" alt="Färjan från Hanka till Nagu"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Jag cyklade alltid motsols (T.ex., Gustavs -> Iniö riktning). Av den anledningen att det är lättare att planera färjresor.

## Kartor:

+ [Lilla Ringvägen](http://www.mapmytracks.com/explore/activity/1576656). Du kan [ladda ner GPX rutten]({{ site.baseurl }}/public/gpx/LillaSkargard.gpx)
+ (Verklig) [Ringvägen](http://www.everytrail.com/view_trip.php?trip_id=3183466) Tyvärr, den GPX rutten är inte komplett. [Ladda ner GPX rutten]({{ site.baseurl }}/public/gpx/skargard.gpx)
+ [Den officiella ringvägen ruttbeskrivningen](http://saaristonrengastie.fi/sv/content/ruttbeskrivning)

## Färjar:

+ [Skärgårdens färjplatser och tidtabeller](http://www.finferries.fi/sv/farjetrafik/farjplatserna-och-tidtabellerna.html). De följande båtarna åker sällan:
  + [Iniö-Gustavs, m/s Aurora](http://www.finferries.fi/sv/farjetrafik/farjplatserna-och-tidtabellerna/inio-gustavs-aurora.html)
  + [Houtskär - Iniö, m/s Antonia](http://www.finferries.fi/sv/farjetrafik/farjplatserna-och-tidtabellerna/skargardens-ringvag-houtskar-inio.html) 
  + [Korpo-Houtskär, m/s Stella och m/s Mergus](http://www.finferries.fi/sv/farjetrafik/farjplatserna-och-tidtabellerna/korpo-houtskar.html)
  + [Nagu-Själö-Hanka, m/s Östern](http://www.ostern.fi/aikataulu) Du behöver absolut den färjan på Lilla Ringvägen!

Om du vill fortsätta fram till Åland, kan du ta de följande båtarna:

+ [Osnäs - Åva, Norra linjen](http://www.alandstrafiken.ax/sites/www.alandstrafiken.ax/files/osnas-ava_2.pdf) Den färjan kopplar Gustavs och Brändö, Åland.
+ [Galtby - Kökar, Södra linjen](http://www.alandstrafiken.ax/sites/www.alandstrafiken.ax/files/sodralinjen.pdf) Den färjan kopplar Korpo och  Åland öar.

## Bussar och tåg:

+ [Finska järnvägar](https://www.vr.fi/cs/vr/sv/etusivu_sv)
+ [Matkahuolto bussar](https://matkahuolto.fi/sv/)
+ [Onnibus bussar](http://www.onnibus.com/en/timetables.htm)

Matkahuolto är dyrare än Onnibus men de har aldrig vedermödor med cykel baggage. VR biljetter är de dyraste och det finns brist på cykelplatser på VR tåg.

## Boende

+ [Skärgårdsbokning](http://skargardsbokning.fi/?l=sv&p=majoitus)
+ [Åland boendealternativ](http://www.visitaland.com/bo-aland/)

Mitt favorithotell på Åland är [Gullvivan](http://www.gullvivan.ax/) på Brändö.

# Berömda sevärdheter

<a data-flickr-embed="true" href="https://www.flickr.com/photos/vitalyrepin/7718507264/in/album-72157630932242066/" title="Inuti Nagu kyrka"><img src="https://farm9.staticflickr.com/8428/7718507264_a2624565e4_c.jpg" width="100%" height="100%" alt="Inuti Nagu kyrka"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Jag gillar att bekanta mig med gamla kyrkor. Den rutten är ett paradis för en man som jag eftersom du kan känna en fläkt av Historia (med stora "H") där.

Medeltida kyrkor:

+ [Tövsala kyrka,  byggd på 1300-talet](http://www.saaristonrengastie.fi/sv/content/tovsala-heliga-korsets-kyrka)
+ [Korpo kyrka, byggd i slutet av 1200-talet](https://sv.wikipedia.org/wiki/Korpo_kyrka)
+ [Nagu kyrka, byggd på 1440-talet](https://sv.wikipedia.org/wiki/Nagu_kyrka)
+ [Rimito kyrka, byggd  i början av 1300-talet](https://sv.wikipedia.org/wiki/Rimito_kyrka)
+ [Nådendals kloster. Det var verksamt från 1438 till 1591](https://sv.wikipedia.org/wiki/N%C3%A5dendals_kloster)
+ [Åbo domkyrka, byggd i slutet av 1200-talet](https://sv.wikipedia.org/wiki/%C3%85bo_domkyrka)

Fina gamla kyrkor:

+ [Träkyrkan i Gustavs](http://visitkustavi.fi/index.php?option=com_content&view=article&id=419:den-korsbyggda-tr%C3%A4kyrkan-och-kyrkog%C3%A5rden-i-gustavs&catid=188&Itemid=932&lang=sv)
+ [Iniö kyrka, byggd under åren 1797-1800](http://www.saaristonrengastie.fi/sv/content/inio-kyrka-sophia-wilhelmina)

Om du är intresserad av finsk historia även lite, vet du namnet på [friherre Mannerheim](https://sv.wikipedia.org/wiki/Gustaf_Mannerheim).
Han var född och tillbringade sin barndom i [Villnäs slott](http://www.kansallismuseo.fi/sv/villnas-slott). Museet är mycket imponerande. Glöm inte att besöka det!

Du kan hitta mera intressanta sevärdheter i böker om skärgården och på Internet. Jag ska påpeka blott få källor här:

+ [Rengastietä Turun saaristoon. The Archipelago Trail : experience the Islands of Turku av Lauri Hokkinen](http://haku.helmet.fi/iii/encore/record/C__Rb1988945__Slauri%20hokkinen__P0%2C4__Orightresult__U__X4?lang=swe&suite=cobalt)
+ [Den officialla turistinformationen](http://saaristonrengastie.fi/sv/palvelut/nahtavyydet)

# Vi ses på Skärgården!

<a data-flickr-embed="true" href="https://www.flickr.com/photos/vitalyrepin/7719065510/in/album-72157630932242066/" title="Genom Skärgården med cykel"><img src="https://farm8.staticflickr.com/7252/7719065510_5f1de1a504_c.jpg" width="100%" height="100%" alt="Genom Skärgården med cykel"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Jag hoppas att råka er, mina kära läsare, i skärgården! Det är en underbar upplevelse att cykla genom Åbolands skärgård på ringvägen. Vänta inte, cykla nu!

Titta på mina foton och videofilmer av skärgården i Flickr album (45 foton och 12 videofilmer inne):

<a data-flickr-embed="true" href="https://www.flickr.com/photos/vitalyrepin/sets/72157656704669155" title="Åbolands skärgård"><img src="https://farm4.staticflickr.com/3846/19255193440_c5d9b7d10b_c.jpg" width="100%" height="100%" alt="Åbolands skärgård "></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

{% include twitter_plug_sv.html %}

