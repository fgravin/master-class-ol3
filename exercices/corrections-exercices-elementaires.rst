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



.. _correction-exercice-elementaire-3:

Correction exercice élémentaire 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`exercice-elementaire-3`

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
