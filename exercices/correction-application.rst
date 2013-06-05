Correction application
----------------------


.. _correction-application-etape-1:

Correction étape 1
~~~~~~~~~~~~~~~~~~

:ref:`application-etape-1`

.. code-block:: html

    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <title>Application</title>
        <style type="text/css">
          html, body, .map {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
          }
        </style>
      </head>
      <body>
        <div id="map" class="map"></div>

        <script src="http://ol3js.org/en/master/build/ol.js"></script>
        <script>
        var view = new ol.View2D();
        var map = new ol.Map({
          target: 'map',
          view: view,
          layers: [
            new ol.layer.TileLayer({
              source: new ol.source.OSM()
            })
          ]
        });
        var extent = [-40679590.16384748, -40093165.28284361,
            5967723.758526416, 6264605.176386041];
        view.fitExtent(extent, map.getSize());
        </script>
      </body>
    </html>

.. _correction-application-etape-2:

Correction étape 2
~~~~~~~~~~~~~~~~~~

:ref:`application-etape-2`

.. code-block:: html

    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <title>Application</title>
        <style type="text/css">
          html, body, .map {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
          }
        </style>
      </head>
      <body>
        <div id="map" class="map"></div>

        <script src="http://cdnjs.cloudflare.com/ajax/libs/proj4js/1.1.0/proj4js-compressed.js"></script>
        <script src="http://ol3js.org/en/master/build/ol.js"></script>
        <script>
        Proj4js.defs['EPSG:2154'] = '+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 ' +
            '+lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 '+
            '+units=m +no_defs';

        var view = new ol.View2D();
        var map = new ol.Map({
          target: 'map',
          view: view,
          layers: [
            new ol.layer.TileLayer({
              source: new ol.source.OSM()
            })
          ]
        });
        var extent = [-40679590.16384748, -40093165.28284361,
            5967723.758526416, 6264605.176386041];
        view.fitExtent(extent, map.getSize());
        </script>
      </body>
    </html>


.. _correction-application-etape-3:

Correction étape 3
~~~~~~~~~~~~~~~~~~

:ref:`application-etape-3`

.. code-block:: html

    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <title>Application</title>
        <style type="text/css">
          html, body, .map {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
          }
        </style>
      </head>
      <body>
        <div id="map" class="map"></div>

        <script src="http://cdnjs.cloudflare.com/ajax/libs/proj4js/1.1.0/proj4js-compressed.js"></script>
        <script src="http://ol3js.org/en/master/build/ol.js"></script>
        <script>
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

        var view = new ol.View2D({
          projection: 'EPSG:2154',
          resolutions: resolutions
        });

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

        var map = new ol.Map({
          target: 'map',
          renderer: ol.RendererHint.CANVAS,
          view: view,
          layers: [carteLayer]
        });

        var initialExtent = [117427.53782167949, 410639.9782710938,
            6731783.8687657695, 6880224.577668993];
        view.fitExtent(initialExtent, map.getSize());
        </script>
      </body>
    </html>


.. _correction-application-etape-4:

Correction étape 4
~~~~~~~~~~~~~~~~~~

:ref:`application-etape-4`

Pour créer la deuxième couche :

.. code-block:: javascript

    var satelliteLayer = new ol.layer.TileLayer({
      source: new ol.source.TiledWMS({
        url: 'http://tile.geobretagne.fr/gwc02/service/wms',
        params: {
          'LAYERS': 'satellite',
          'VERSION': '1.1.1'
        },
        tileGrid: new ol.tilegrid.TileGrid({
          resolutions: resolutions,
          origin: [-357823.2365, 1313632.3628]
        }),
        extent: extent
      })
    });

La nouvelle configuration de la carte:

.. code-block:: javascript

    var map = new ol.Map({
      target: 'map',
      renderer: ol.RendererHint.CANVAS,
      view: view,
      layers: [carteLayer, satelliteLayer]
    });


.. _correction-application-etape-5:

Correction étape 5
~~~~~~~~~~~~~~~~~~

:ref:`application-etape-5`

.. code-block:: html

    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <title>Application</title>
        <style type="text/css">
          html, body, .map {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
          }
          #background-selector {
            position: absolute;
            top: 2px;
            right: 2px;  
            z-index: 100;
          }
        </style>
      </head>
      <body>
        <div id="map" class="map">
          <select id="background-selector">
            <option value="carte" selected>Carte</option>
            <option value="satellite">Satellite</option>
          </select>
        </div>

        <script src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/proj4js/1.1.0/proj4js-compressed.js"></script>
        <script src="http://ol3js.org/en/master/build/ol.js"></script>
        <script>
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

        var view = new ol.View2D({
          projection: 'EPSG:2154',
          resolutions: resolutions
        });

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

        var satelliteLayer = new ol.layer.TileLayer({
          source: new ol.source.TiledWMS({
            url: 'http://tile.geobretagne.fr/gwc02/service/wms',
            params: {
              'LAYERS': 'satellite',
              'VERSION': '1.1.1'
            },
            tileGrid: new ol.tilegrid.TileGrid({
              resolutions: resolutions,
              origin: [-357823.2365, 1313632.3628]
            }),
            extent: extent
          })
        });


        var map = new ol.Map({
          target: 'map',
          renderer: ol.RendererHint.CANVAS,
          view: view,
          layers: [carteLayer, satelliteLayer]
        });

        var initialExtent = [117427.53782167949, 410639.9782710938,
            6731783.8687657695, 6880224.577668993];
        view.fitExtent(initialExtent, map.getSize());

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

        </script>
      </body>
    </html>


.. _correction-application-etape-6:

Correction étape 6
~~~~~~~~~~~~~~~~~~

:ref:`application-etape-6`

Le code pour créer la couche "paimpol_zone_plu_ccpg" :

.. code-block:: javascript

    var paimpollayer = new ol.layer.imagelayer({
      source: new ol.source.singleimagewms({
        url: 'http://geobretagne.fr/geoserver/id22/wms',
        params: {
          'layers': 'paimpol_zone_plu_ccpg',
          'version': '1.1.1',
          'transparent': 'true'
        },
        extent: extent
      })
    });

La nouvelle configuration de la carte, ainsi que le nouvel appel
à ``fitExtent`` pour centrer la vue sur Paimpol :

.. code-block:: javascript

    var map = new ol.Map({
      target: 'map',
      renderer: ol.RendererHint.CANVAS,
      view: view,
      layers: [carteLayer, satelliteLayer, paimpolLayer]
    });

    var initialExtent = [246462.7961724792, 264788.57370056753,
        6864884.621557758, 6874162.16586421];
    view.fitExtent(initialExtent, map.getSize());


.. _correction-application-etape-7:

Correction étape 7
~~~~~~~~~~~~~~~~~~

:ref:`application-etape-7`

.. code-block:: html

    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <title>Application</title>
        <style type="text/css">
          html, body, .map {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
          }
          #background-selector {
            position: absolute;
            top: 2px;
            right: 2px;  
            z-index: 100;
          }
          #geolocation {
            position: absolute;
            top: 2px;
            right: 76px;
            z-index: 100;
          }
        </style>
      </head>
      <body>
        <div id="map" class="map">
          <select id="background-selector">
            <option value="carte" selected>Carte</option>
            <option value="satellite">Satellite</option>
          </select>
          <button id="geolocation">Localise moi!</button>
        </div>

        <script src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/proj4js/1.1.0/proj4js-compressed.js"></script>
        <script src="http://ol3js.org/en/master/build/ol.js"></script>
        <script>
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

        var view = new ol.View2D({
          projection: 'EPSG:2154',
          resolutions: resolutions
        });

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

        var satelliteLayer = new ol.layer.TileLayer({
          source: new ol.source.TiledWMS({
            url: 'http://tile.geobretagne.fr/gwc02/service/wms',
            params: {
              'LAYERS': 'satellite',
              'VERSION': '1.1.1'
            },
            tileGrid: new ol.tilegrid.TileGrid({
              resolutions: resolutions,
              origin: [-357823.2365, 1313632.3628]
            }),
            extent: extent
          })
        });

        var paimpolLayer = new ol.layer.ImageLayer({
          source: new ol.source.SingleImageWMS({
            url: 'http://geobretagne.fr/geoserver/id22/wms',
            params: {
              'LAYERS': 'paimpol_zone_plu_ccpg',
              'VERSION': '1.1.1',
              'TRANSPARENT': 'TRUE'
            },
            extent: extent
          })
        });


        var map = new ol.Map({
          target: 'map',
          renderer: ol.RendererHint.CANVAS,
          view: view,
          layers: [carteLayer, satelliteLayer, paimpolLayer]
        });

        var initialExtent = [246462.7961724792, 264788.57370056753,
            6864884.621557758, 6874162.16586421];
        view.fitExtent(initialExtent, map.getSize());


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

        var geoloc = new ol.Geolocation({projection: 'EPSG:2154'});
        geoloc.on('change:position', function() {
            view.setCenter(geoloc.getPosition());
            geoloc.setTracking(false);
        });
        $('#geolocation').click(function() {
          geoloc.setTracking(true);
        });

        </script>
      </body>
    </html>

