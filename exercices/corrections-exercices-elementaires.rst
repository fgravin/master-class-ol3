Corrections des exercices élémentaires
--------------------------------------


.. _correction-exercice-elementaire-1:

Correction exercice élémentaire 1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-1`

Aucune correction pour cet exercice.


.. _correction-exercice-elementaire-2:

Correction exercice élémentaire 2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-2`

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>Exercice élémentaire</title>
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <style>
            #map {
              width: 600px;
              height: 400px;
            }
        </style>
      </head>
      <body>
          <div id="map"></div>
          <script src="http://ol3js.org/en/master/build/ol.js"></script>
          <script>
          var map = new ol.Map({
            target: 'map',
            view: new ol.View2D({
              zoom: 0,
              center: [0, 0]
            }),
            layers: [
              new ol.layer.TileLayer({
                source: new ol.source.OSM()
              })
            ],
            renderer: ol.RendererHint.CANVAS
          });
          </script>
      </body>
    </html>

Pour que *renderer* DOM soit utilisé il faut passer la valeur
``ol.RendererHint.DOM`` pour l'option ``renderer``. Et pour que
le renderer puisse être spécifié dans l'URL c'est la valeur retournée
par la fonction ``ol.RendererHints.createFromQueryData`` qu'il faut
passer.


.. _correction-exercice-elementaire-3:

Correction exercice élémentaire 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-3`

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>Exercice élémentaire</title>
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <style>
            #map {
              width: 600px;
              height: 400px;
            }
        </style>
      </head>
      <body>
          <div id="map"></div>
          <script src="http://ol3js.org/en/master/build/ol.js"></script>
          <script>
          var map = new ol.Map({
            target: 'map',
            view: new ol.View2D({
              zoom: 12,
              center: [259489.78506858557, 6251530.865964714],
              rotation: 45
            }),
            layers: [
              new ol.layer.TileLayer({
                source: new ol.source.OSM()
              })
            ]
          });
          </script>
      </body>
    </html>



.. _correction-exercice-elementaire-4:

Correction exercice élémentaire 4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-4`

.. code-block:: javascript

    > view = map.getView()
    > view.getCenter()
    > view.setCenter([259489.78506858557, 6251530.865964714])
    > view.getResolution()
    > view.setResolution(view.getResolution() / 4096)
    > view.setRotation(45)

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>Exercice élémentaire</title>
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <style>
            #map {
              width: 600px;
              height: 400px;
            }
        </style>
      </head>
      <body>
          <div id="map"></div>
          <script src="http://ol3js.org/en/master/build/ol.js"></script>
          <script>
          var map = new ol.Map({
            target: 'map',
            view: new ol.View2D({
              zoom: 0,
              center: [0, 0]
            }),
            layers: [
              new ol.layer.TileLayer({
                source: new ol.source.OSM()
              })
            ]
          });
          view = map.getView()
          view.setCenter([259489.78506858557, 6251530.865964714])
          view.setResolution(view.getResolution() / 4096)
          view.setRotation(45)
          </script>
      </body>
    </html>


.. _correction-exercice-elementaire-5:

Correction exercice élémentaire 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-5`

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>Exercice élémentaire</title>
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <style>
            #map {
              width: 600px;
              height: 400px;
            }
        </style>
      </head>
      <body>
          <div id="map"></div>
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

          var extent = [248024.23082580912, 270955.339311362,
                        6243887.163136197, 6259174.568793232];
          view.fitExtent(extent, map.getSize());
          </script>
      </body>
    </html>

La fonction ``fitExtent`` a besoin de connaître les dimensions de la carte en
pixels pour être capable de recentrer la vue sur une étendue donnée. La vue est
en effet complétement déterminée par un centre, une résolution et une rotation,
et elle n'a aucune connaissance des dimensions du rectangle d'affichange dans
la page. Dans ces conditions, si on ne lui passe pas des dimensions (largeur et
hauteur en pixels), il ne lui est pas possible de recentrer la vue sur une
étendue géographique.


.. _correction-exercice-elementaire-6:

Correction exercice élémentaire 6
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-6`

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>Exercice élémentaire</title>
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <style>
            #map {
              width: 600px;
              height: 400px;
            }
        </style>
      </head>
      <body>
          <div id="map"></div>
          <script src="http://ol3js.org/en/master/build/ol.js"></script>
          <script>
          var map = new ol.Map({
            target: 'map',
            view: new ol.View2D({
              zoom: 12,
              center: [259489.78506858557, 6251530.865964714]
            }),
            layers: [
              new ol.layer.TileLayer({
                source: new ol.source.OSM({
                  attributions: [
                    new ol.Attribution(
                      '<a href="http://www.opencyclemap.org/">OpenCycleMap</a>'),
                    ol.source.OSM.DATA_ATTRIBUTION
                  ],
                  url: 'http://{a-c}.tile3.opencyclemap.org/landscape/{z}/{x}/{y}.png',
                })
              })
            ],
            renderer: ol.RendererHint.CANVAS
          });
          </script>
      </body>
    </html>


.. _correction-exercice-elementaire-7:

Correction exercice élémentaire 7
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-7`

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>Exercice élémentaire</title>
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <style>
            #map {
              width: 600px;
              height: 400px;
            }
        </style>
      </head>
      <body>
          <div id="map"></div>
          <script src="http://ol3js.org/en/master/build/ol.js"></script>
          <script>
          var map = new ol.Map({
            target: 'map',
            view: new ol.View2D({
              zoom: 0,
              center: [0, 0]
            }),
            layers: [
              new ol.layer.TileLayer({
                source: new ol.source.OSM(),
                brightness: 0.1,
                contrast: 1.625,
                hue: -1.25,
                opacity: 0.5,
                saturation: 5
              })
            ]
          });
          </script>
      </body>
    </html>

Il est important de noter ici que les paramètres d'affichage (``opacity``,
etc.) sont des paramètres de l'objet ``Layer``, et non de l'objet ``Source``.
La source ne concerne que les données elles mêmes, et pas la façon dont ces
données sont affichées.

Pour changer la visibilité de la couche dans la console :

.. code-block:: javascript

    > layerCollection = map.getLayers()
    > osmLayer = layerCollection.getAt(0)
    > osmLayer.setVisible(!osmLayer.getVisible())
    > osmLayer.setVisible(!osmLayer.getVisible())


.. _correction-exercice-elementaire-8:

Correction exercice élémentaire 8
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-8`

Dans la console :

.. code-block:: javascript

    > ol.proj.transform(map.getView().getCenter(), 'EPSG:3857', 'EPSG:4326')

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>Exercice élémentaire</title>
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <style>
            #map {
              width: 600px;
              height: 400px;
            }
        </style>
      </head>
      <body>
          <div id="map"></div>
          <script src="http://ol3js.org/en/master/build/ol.js"></script>
          <script>
          var center = ol.proj.transform(
            [2.3310364, 48.8623122], 'EPSG:4326', 'EPSG:3857');
          var map = new ol.Map({
            target: 'map',
            view: new ol.View2D({
              zoom: 12,
              center: center
            }),
            layers: [
              new ol.layer.TileLayer({
                source: new ol.source.OSM()
              })
            ]
          });
          </script>
      </body>
    </html>


.. _correction-exercice-elementaire-9:

Correction exercice élémentaire 9
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-9`

Si rien concernant les *controls* n'est spécifié dans l'objet d'options passé
au constructeur ``ol.Map`` alors ``ol.Map`` crèe trois *controls* (les
*controls* par défaut) : ``ol.control.Attribution``, ``ol.control.Logo``, et
``ol.control.Zoom``.

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>Exercice élémentaire</title>
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <style>
            #map {
              width: 600px;
              height: 400px;
            }
        </style>
      </head>
      <body>
          <div id="map"></div>
          <script src="http://ol3js.org/en/master/build/ol.js"></script>
          <script>
          var map = new ol.Map({
            target: 'map',
            view: new ol.View2D({
              zoom: 0,
              center: [0, 0]
            }),
            layers: [
              new ol.layer.TileLayer({
                source: new ol.source.OSM()
              })
            ],
            controls: ol.control.defaults({}, [
              new ol.control.ScaleLine({
                units: ol.control.ScaleLineUnits.IMPERIAL
              })
            ])
          });
          </script>
      </body>
    </html>


.. _correction-exercice-elementaire-10:

Correction exercice élémentaire 10
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-10`

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>Exercice élémentaire</title>
        <link rel="stylesheet" href="http://ol3js.org/en/master/build/ol.css" type="text/css">
        <style>
            #map {
              width: 600px;
              height: 400px;
            }
        </style>
      </head>
      <body>
          <div id="map"></div>
          <script src="http://ol3js.org/en/master/build/ol.js"></script>
          <script>
          var map = new ol.Map({
            target: 'map',
            view: new ol.View2D({
              zoom: 0,
              center: [0, 0]
            }),
            layers: [
              new ol.layer.TileLayer({
                source: new ol.source.OSM()
              })
            ],
            interactions: ol.interaction.defaults({}, [
              new ol.interaction.DragRotateAndZoom()
            ])
          });
          </script>
      </body>
    </html>
