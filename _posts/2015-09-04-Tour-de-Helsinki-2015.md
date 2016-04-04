---
layout: post
title: Tour de Helsinki 2015. Nybörjares intryck från cykelloppet
thumbnail: TourDeHelsinki.png
category: sv
comments: true
lang: sv
locale: sv_SE
geomap: true
summary: Tour de Helsinki 2015. En delatagares notiser.
tags: [cycling,Finland]
---

# Tour de Helsinki — mitt första cykellopp

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

  var track = new L.GPX("{{site.baseurl}}/public/gpx/TourDeHelsinki2015.gpx",
  			{ async: true,
  			  marker_options: {
    				startIconUrl: false,
    				endIconUrl: false,
    				shadowUrl: false
  				},
			  polyline_options: {
			  	color: '#4B0082',
				weight: 4,
				opacity: 1
				}
			 });

  var tileUrl = 'http://{s}.tile.thunderforest.com/cycle/{z}/{x}/{y}.png',
  layer = new L.TileLayer(tileUrl, {maxZoom: 18, attribution: 'Tiles courtesy of <a href="http://www.thunderforest.com/opencyclemap/" target="_blank">OpenCycleMap</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'});
map.addLayer(layer);

 var locArr = [
                     [60.387993, 24.6453871],
                     [60.514133, 24.921212],
                     [60.4704712,25.216704],
                     [60.3365452,25.1438347],
                     [60.2013977, 24.9453899]
                 ];

 var descArr = [
                      "<a href='http://www.tourdehelsinki.fi/en/route' target='_blank'>Servicepunkten 1: Lepsämäntie</a>",
                      "<a href='http://www.tourdehelsinki.fi/en/route' target='_blank'>Servicepunkten 2: Raalantie</a>",
                      "<a href='http://www.tourdehelsinki.fi/en/route' target='_blank'>Servicepunkten 3: Paippistentie</a>",
                      "<a href='http://www.tourdehelsinki.fi/en/route' target='_blank'>Servicepunkten 4: Vanha Porvoontie</a>",
                      "<a href='https://en.wikipedia.org/wiki/Helsinki_Velodrome' target='_blank'>Start och finish: Velodromen</a>"
               ];


 map.fitBounds(locArr);

 for (var i = 0; i < descArr.length; i++) {
      L.marker(locArr[i]).addTo(map).bindPopup(descArr[i]).openPopup();
 };

 track.addTo(map);
</script>


Tour de Helsinki är ett stort cykellopp som sker i Helsingfors regionen vid slutet av sommaren. Resrutten är 140 km lång och löper runt huvudstadsregioner
(Helsingfors, Vanda, Esbo, Grankulla, Sibbo, Nurmijärvi, Tusby, Hyvinge och Mäntsälä).  Det första loppet gick av stapeln 2005. Nu har det över två tusen deltagare
både tävlings- och fritidscyklister.

Jag har aldrig deltagit i ett cykellopp men nu cyklar jag tävlingscykel  eftersom jag blev intresserad av det här arrangemanget och  bestämde att deltaga i Tour de Helsinki 2015.
Mitt viktigaste mål var inte att vinna (jag är inte alls en tävlingscyklist) utan erfarenhet vad ett stort cykellopp  är.

Det första steget var lätt — att anmäla sig i [tävlings webbtjänst](http://www.tourdehelsinki.fi/en/enrolment) (tyvärr finns det inga svenska webbsidor, bara finska och engelska
användargränssnitt  existerar).  Förresten var det en bra idé att anmäla sig tidigare — det är nämligen billigare (49 € om man anmäler före den 31 maj mot 75 € om man anmäler efter den 29 augusti).

<!--break-->

# Arrangemanget

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/vitalyrepin/20493168624/in/dateposted-public/" title="Tour de Helsinki 2015"><img src="https://farm6.staticflickr.com/5639/20493168624_20391ae5bd_z.jpg" width="100%" height="100%" alt="Tour de Helsinki 2015"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Söndagen den 30 augusti 2015 var tävlingsdagen. På lördagen kom jag till Helsingfors velodrom och fick deltagarpaketet — en nummerlapp, ett datachips (används för att ta start-
och sluttid) och en informationsbroschyr.

På söndagen fanns där en stor skara cyklister.
Varje grupp hade en flagga med gruppens fart — från 20 till 45. Jag och min kompis ställde oss i grupp 30 (vi är optimister!).

Kl. 11 startade vi. De första 10 km for över Helsingfors gator (stängda för övrig trafik) i maklig takt. Själva loppet började vid Alberga i Esbo.

Jag förstod snabbt jag inte kan cykla med gruppen 30 (km/h) och sökte mig till gruppen 28. Det fanns 4 servicepunkter ("huoltopiste" på finska) där man fick en paus, dricka vatten eller saft
och äta russin,  bananer,  bröd samt  ättiksgurkor. De övriga befann sig på olika avstånd från starten — 39.7 km, 63.8 km, 95.9 km samt 117.8 km. Min grupp stannade inte i den första servicepunkten
och jag tog mat och dryck i den andra punkten (63.8 km) för första gången.

Då vi cyklade förbi den första servicepunkten såg vi ett [allvarligt olycksfall](http://svenska.yle.fi/artikel/2015/08/31/borgacyklist-skadades-allvarligt-i-tour-de-helsinki). Polisen och läkare
var där och gav första hjälpen.

För det mesta var vädret soligt med undantag för både en kort åskskur och regn. Då det regnade fick min cykel punktering och jag måste byta en innerslang. Resultatet blev jag lämnade  gruppen 28
och fortsatte separat.

Övervägande cyklade jag ensam men när var jag ungefär 1.5 kilometer från målet hörde jag ljud från grupp 22. Jag snabbade takten och lämnade dem bakom ryggen.
Jag avslutade tävlingen ungefär 1 minuten före gruppen 22.

Cykelloppet avslutades med varm måltid  på velodromen —  bruna bönor och ris & kött.  Det fanns också hydreringsdryck  som jag drack mycket av. På kvällen visste jag redan min resultat
på [Tour de Helsinki webbtjänsten](http://www.tourdehelsinki.fi/en/results).

Jag gillade väldigt arrangemangsorganisationen. I alla korsningar stod en person som visade riktningen, vägmärken informerade om servicepunkter och avtag. När vi kom tillbaka till Helsingfors
var gatorna stängda för biltrafik och trafikljusen blinkade gult. Cyklister kunde cykla utan några avbrott.  Det är viktigt särskilt i det sista resruttsstycket eftersom cyklister var redan trötta.
Jag kände mig trygg för akutbilar var färdiga att förse med första hjälpen längs hela resrutten.

# Mina intryck och feedback

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/vitalyrepin/20929013899/in/album-72157655816012213/" title="Tour de Helsinki 2015"><img src="https://farm1.staticflickr.com/776/20929013899_c1fe9205c1_z.jpg" width="100%" height="100%" alt="Tour de Helsinki 2015"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Jag tyckte om evenemanget. Det var intressant att delta i det stora cykelloppet omkring Heslingfors. Jag gillade särskilt hälsningar från åskådare längs med resrutten.
Men jag tror att några saker kan förbättras:

- För det mesta var evenemangens information på finska (t.ex. informationsbrochyren). Jag drömmer inte om information på svenska (Men varför inte? Vi är i Finland! :-)  ) men kanske vore det är möjligt att ha mera engelskt material?
- Helsingfors vägar var jättefina. Men vägar ute huvudstadsregionen är minsann dåliga.  Mitt framhjul skadades efter resan — det blev vint! Det finns många djupa sprickor i asfalten. Kanske
vägverken kan förbättra situationen?
- Hydreringsdryck var tillgänglig enbart på velodromen men inte på servicepunkterna där serverades bara saft och vatten. Jag tror att hydreringsdryck är mycket bättre än saft för cyklister.

Tusen tack till arrangörer för en superb upplevelse! Jag hoppas kunna fortsätta med cykellopp nästa säsongen.

Titta på foton av Tour de Helsinki 2015 i Flickr album:

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/vitalyrepin/albums/72157655816012213" title="Tour de Helsinki 2015"><img src="https://farm6.staticflickr.com/5812/21107749016_a7c1d7c17a_z.jpg" width="100%" height="100%" alt="Tour de Helsinki 2015"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

{% include twitter_plug_sv.html %}

