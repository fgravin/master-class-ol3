Développement d'une application
-------------------------------

Vous allez ici créer une carte occupant tout l'écran et compatible avec des
appareils mobile. Cette carte affichera des données issues de la plate-forme
GéoBretagne, selon la projection Lambert93 (projection officielle pour les
cartes de France métropolitaine).


.. _application-etape-1:

Étape 1
~~~~~~~

*Créer une page web avec une carte occupant tout l'écran*

Votre objectif à cette étape est d'obtenir une carte quelconque occupant tout
l'écran. La carte sera la plus simple possible : projection globale EPSG:3857
(projection par défaut dans OL3), et une couche OSM.

Vous pouvez, si vous le souhaitez, d'ores-et-déja centrer la carte sur la
Bretagne.  Voici une étendue dans le système de coordonnée EPSG:3857 pour la
Bretagne : ``[-40679590.16384748, -40093165.28284361, 5967723.758526416,
6264605.176386041]``.

.. hint::

    1. Pour créer une carte occupant tout l'écran vous pouvez vous inspirez de
       l'exemple http://ol3js.org/en/master/examples/mobile-full-screen.html.
    2. Pour créer une carte OSM la plus simple possible vous pouvez vous
       inspirez de l'exemple http://ol3js.org/en/master/examples/simple.html.

:ref:`correction-application-etape-1`


.. _application-etape-2:

Étape 2
~~~~~~~

*Charger proj4js dans la page et ajouter la projection Lambert93*

Cette étape consiste à ajouter la bibliothèque proj4js et à la configurer pour
qu'elle puisse fonctionner avec la projection Lambert93 (EPSG:2154).

Pour ajouter la bibliothèque proj4js ajouter à la page une balise ``<script>``
dont l'attribut ``src`` est positionné à
``http://cdnjs.cloudflare.com/ajax/libs/proj4js/1.1.0/proj4js-compressed.js``.

Et pour que proj4js puisse être utilisé pour la projection Lamber93 il faut
déclarer cette projection auprès de proj4js. Comme ceci:

.. code-block:: javascript
    
    Proj4js.defs['EPSG:2154'] = '+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 ' +
        '+lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 '+
        '+units=m +no_defs';

Cette ligne doit donc être ajoutée dans le code JavaScript de la page, avant
la création de la carte.

Le chargement de proj4js et la déclaration de la projection EPSG:2154 ne
devrait avoir aucun impact sur la carte créée à l'étape précédente. Recharger
la page dans le navigateur pour vous en assurer.

:ref:`correction-application-etape-2`


.. _application-etape-3:

Étape 3
~~~~~~~

*Ajouter la couche "carte" de la plate-forme GéoBretagne*

À cette étape vous aller modifier la carte pour que celle-ci la couche WMS
"carte" de la plate-forme GéoBretagne, et que l'affichage se fasse selon la
projection "EPSG:2154". Vous allez pour ceci modifier la configuration de
la vue (``View2D``), et remplacer la source ``ol.source.OSM`` par une source
``ol.source.TiledWMS`` configurée correctement.

1. Le service WMS de la plate-forme GéoBretagne que nous utilisons ici prend en
   charge l'extension `WMS-C
   <http://wiki.osgeo.org/wiki/WMS_Tiling_Client_Recommendation>`_ pour fournir
   des images (tuiles) selon une grille donnée. Cette grille fixe les
   résolutions d'affichage et l'étendue des tuiles.
   
   Dans un but de préparation créer dans le code JavaScript de la page, après
   la définition de la projection EPSG:2154, deux tableaux JavaScript : un
   contenant les résolutions prises en charge par le service WMS-C, et un
   contenant l'étendue des tuiles.

   .. code-block:: javascript
       
        Proj4js.defs['EPSG:2154'] = '+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 ' +
            '+lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 '+
            '+units=m +no_defs';

        var resolutions = [156543.0339, 78271.51695, 39135.758475,
            19567.8792375, 9783.93961875, 4891.969809375,
            2445.9849046875, 1222.99245234375, 611.4962261718748,
            305.7481130859374, 152.87405654296887, 76.43702827148444,
            38.21851413574208, 19.10925706787104, 9.55462853393552,
            4.77731426696776, 2.38865713348388, 1.1943285667420798,
            0.5971642833710399, 0.29858214168551994, 0.14929107084275997,
            0.07464553542123999];

        var extent = [-357823.2365, 1313632.3628, 6037008.6939, 7230727.3772];

   Le service de la plate-forme GéoBretagne utilisé ici est décrit à cette
   page: http://tile.geobretagne.fr/gwc02/home. Les résolutions et l'étendue
   sont définies dans le document WMS GetCapabilities à cette URL :
   http://tile.geobretagne.fr/gwc02/service/wms?SERVICE=WMS&VERSION=1.1.1&REQUEST=getcapabilities&TILED=true

2. Il s'agit maintenant de configurer la vue (``View2D``) pour que la carte
   soit représentée selon la projection EPSG:2154 et que les résolutions d'affichage
   soient celles prises en charge par le service WMS-C.

   .. code-block:: javascript

        var view = new ol.View2D({
          projection: 'EPSG:2154',
          resolutions: resolutions
        });

3. Vous allez maintenant créer un objet de type ``ol.layer.TileLayer``
   permettant d'afficher les tuiles de la couche WMS-C "carte" du 
   service http://tile.geobretagne.fr/gwc02/service/wms. Voici le code à écrire
   pour créer cet objet:

   .. code-block:: javascript

        var carteLayer = new ol.layer.TileLayer({
          source: new ol.source.TiledWMS({
            url: 'http://tile.geobretagne.fr/gwc02/service/wms',
            params: {
              'LAYERS': 'carte',
              'VERSION': '1.1.1'
            },
            tileGrid: new ol.tilegrid.TileGrid({
              resolutions: resolutions,
              origin: [-357823.2365, 1313632.3628]
            }),
            extent: extent
          })
        });

   Ce bloc de code peut être ajouté après la création de la vue. Prenez un peu
   de temps pour le comprendre. (Et poser des questions !)

4. Maintenant que la vue et la couche sont créées il faut adapter l'objet
   d'options passé à ``ol.Map``:

   .. code-block:: javascript

        var map = new ol.Map({
          target: 'map',
          renderer: ol.RendererHint.CANVAS,
          view: view,
          layers: [carteLayer]
        });

   À noter que le *renderer* Canvas est utilisé ici. Dans ce cas précis,
   à cause d'une limitation au niveau du service WMS (en-tête `CORS
   <https://developer.mozilla.org/en-US/docs/HTTP/Access_control_CORS>`_ non
   positionné par le serveur), il n'est pas possible d'utiliser le *renderer*
   WebGL.

5. La dernière étape consiste à centrer la vue sur la Bretagne:

   .. code-block:: javascript

        var initialExtent = [117427.53782167949, 410639.9782710938,
            6731783.8687657695, 6880224.577668993];
        view.fitExtent(initialExtent, map.getSize());

:ref:`correction-application-etape-3`


.. _application-etape-4:

Étape 4
~~~~~~~

*Ajouter une deuxième couche tuilée*

Ajoutez à cette étape une deuxième couche WMS tuilée, exactement du même type
que la première mais reposant sur la couche WMS "satellite".

Les deux couches étant opaques vous observerez que la couche "satellite"
recouvre complètement la couche "carte".

:ref:`correction-application-etape-4`


.. _application-etape-5:

Étape 5
~~~~~~~

*Ajouter un outil de sélection de couche*

À cette étape vous allez ajouter un outil de type ``<select>`` permettant
de sélectionner, parmi "carte" et "satellite", quelle couche est visible.

Cette étape nécessite d'ajouter des éléments HTML dans la page, et de manipuler
ces éléments en JavaScript. Pour faciliter la manipulation d'éléments DOM en
JavaScript nous allons utiliser la célèbre bibliothèque jQuery.

Tout d'abord, pour charger jQuery dans la page ajouter la balise ``<script>``
suivante:

.. code-block:: html

    <script src="http://code.jquery.com/jquery-2.0.0.min.js"></script>

Ensuite, ajouter une balise ``<select>`` dans le code HTML, à l'intérieur du
``div`` de la carte:

.. code-block:: html

    <div id="map" class="map">
      <select id="background-selector">
        <option value="carte" selected>Carte</option>
        <option value="satellite">Satellite</option>
      </select>
    </div>

Afin de placer le sélecteur dans la carte, un peu de CSS est nécessaire:

.. code-block:: css

      #background-selector {
        position: absolute;
        top: 2px;
        right: 2px;  
        z-index: 100;
      }

Il ne reste alors plus qu'à écrire le code JavaScript permettant de changer
la visibilité des couches quand la sélection change:

.. code-block:: javascript

    $('#background-selector').change(function() {
      var selected = $(this).find(':selected').val();
      if (selected == 'carte') {
        carteLayer.setVisible(true);
        satelliteLayer.setVisible(false);
      } else if (selected == 'satellite') {
        carteLayer.setVisible(false);
        satelliteLayer.setVisible(true);
      }
    });
    $('#background-selector').trigger('change');

À titre d'exercice, déterminer pourquoi cette dernière ligne est nécessaire.

Toujours à titre d'exerice vous pouve écrire ce code JavaScript sans utiliser
jQuery. Il est en effet un peu idiot de charger jQuery pour si peu.

:ref:`correction-application-etape-5`


.. _application-etape-6:

Étape 6
~~~~~~~

*Ajouter une couche image*

Pour cette étape vous devez ajouter une couche non-tuilée (de type image) pour
la couche WMS "paimpol_zone_plu_ccpg" du service WMS
http://geobretagne.fr/geoserver/id22/wms.

Pour bien visualiser la couche vous pouvez changer la valeur de
``initialExtent`` pour se rapprocher de la commune Paimpol:

.. code-block:: javascript

    var initialExtent = [246462.7961724792, 264788.57370056753,
        6864884.621557758, 6874162.16586421];
    view.fitExtent(initialExtent, map.getSize());


.. hint::

   1. Vous utiliserez ici ``ol.layer.ImageLayer`` plutôt que
      ``ol.layer.TileLayer``.
   2. Et vous utiliserez ``ol.source.SingleImageWMS`` plutôt que
      ``ol.source.TiledWMS``.


:ref:`correction-application-etape-6`


.. _application-etape-7:

Étape 7
~~~~~~~

*Ajouter un bouton de géo-localisation*

Il s'agit à cette étape d'ajouter à la carte un bouton permettant
à l'utilisateur de centrer la carte sur sa position actuelle.

La classe ``ol.Geolocation`` d'OpenLayers doit être utilisée pour ça.

En exercice *bonus* : animer le recentrage de la carte pour chaque
géo-localisation. (La solution de cette exercice bonus n'est pas donnée dans la
correction.)

:ref:`correction-application-etape-7`
