Exercices élémentaires
----------------------

Tous les exercices de cette partie se font à partir de la page HTML suivante :

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
          </script>
      </body>
    </html>



.. _exercice-elementaire-1:

Exercice élémentaire 1
~~~~~~~~~~~~~~~~~~~~~~

*Afficher une carte simple*

1. Copier le code HTML donné ci-dessus et le coller dans un fichier du nom de
   votre choix, ``exercice-elementaire-1.html`` par exemple.
2. Placer ce fichier dans un répertoire rendu accessible par HTTP par le serveur
   web.
3. Ouvrir la page web dans un navigateur, en utilisant ``http`` comme protocole
   d'accès à la page.
4. Vérifier que l'exemple fonctionne correctement.
5. Utiliser les *interactions* et les *controls* de la carte.

(Pas de correction pour cet exercice.)


.. _exercice-elementaire-2:

Exercice élémentaire 2
----------------------

*Choisir le renderer de la carte*

OL3 peut utiliser trois technologies web différentes pour l'affichage de la
carte : WebGL, Canvas, et DOM. Si rien n'est précisé par l'utilisateur la
librairie OL3 choisit WebGL si le navigateur prend en charge WebGL. Sinon OL3
choisit Canvas, et enfin, si Canvas n'est pas pris en charge, c'est le
*renderer* DOM qui est utilisé.

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-2.html`` par exemple.
2. Faire en sorte que le *renderer* Canvas soit utilisé par la carte. Il
   faut pour ceci positionner la propriété ``renderer`` dans l'objet d'options
   passé au constructeur ``ol.Map``. Et la valeur pour cette propriété doit
   être ``ol.RendererHint.CANVAS``.
3. Faire maintenant en sorte que ce soit le *renderer* DOM qui soit utilisé.
4. Utiliser maintenant la valeur ``ol.RendererHints.createFromQueryData()``
   pour que le *renderer* puisse être spécifié dans l'URL par le paramètre
   ``renderer``. Exemple : ``exercice-elementaire-2.html?renderer=canvas``.

:ref:`correction-exercice-elementaire-2`


.. _exercice-elementaire-3:

Exercice élémentaire 3
~~~~~~~~~~~~~~~~~~~~~~

*Initialiser la vue de la carte*

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-3.html`` par exemple.
2. Modifier l'objet d'options passés au constructeur ``ol.View2D`` pour
   que la vue soit initialisée avec un niveau de zoom égal à 12.
3. Modifier à nouveau l'objet d'options pour que la vue soit initialisée
   avec un centre égal à ``[259489.78506858557, 6251530.865964714]``.
4. Modifier à nouveau l'objet d'options pour que la vue soit pivotée
   (rotation) d'un angle de 45 degré à l'est.

:ref:`correction-exercice-elementaire-3`



.. _exercice-elementaire-4:

Exercice élémentaire 4
~~~~~~~~~~~~~~~~~~~~~~

*Changer la vue de la carte*

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-4.html`` par exemple.
2. Ouvrir la nouvelle page HTML et ouvrir les outils de développement du
   navigateur. Vous pouvez utiliser la touche ``F12`` comme raccourci.
3. Saisir dans la console des outils de développement la commande JavaScript
   permettant d'obtenir le centre actuel de la vue.
4. Toujours dans la console, agir sur la vue pour changer son centre à
   ``[259489.78506858557, 6251530.865964714]``.
5. Obtenir dans la console la résolution actuelle de la vue.
6. Agir sur la vue pour passer à une résolution 4096 fois plus petite que
   la résolution actuelle.
7. Agir sur la vue pour faire pivoter la carte de 45 degré à l'est.
8. Ajouter les lignes JavaScript saisies précédemment dans la console dans
   le code JavaScript de la page HTML, juste après la création de la carte.
   Recharger la page dans le navigateur et vérifier que la vue est correcte.
   
.. hint::

   * La variable ``map`` définie dans le code JavaScript de la page est
     globale. Elle est donc directement accessible dans la console.
   * Pour obtenir l'objet *vue* (``ol.View2D``) avec lequel la carte a été
     configurée il faut utiliser ``map.getView()``.
   * Les objets de type ``ol.View2D`` fournissent des fonctions *getter*
     pour accéder aux états de la vue. Exemple : ``view.getCenter()``.
   * De la même façon ils fournissent des *setters* pour changer les états
     de la vue. Exemple : ``view.setRotation(45)``.

:ref:`correction-exercice-elementaire-4`


.. _exercice-elementaire-5:

Exercice élémentaire 5
~~~~~~~~~~~~~~~~~~~~~~

*Aller un peu plus loin avec la vue*

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-5.html`` par exemple.
2. Modifier le code JavaScript de la page afin que l'objet ``ol.View2D`` soit
   créé à l'extérieur de la définition de l'objet des options passé à la carte.
   L'objet ``ol.View2D`` créé sera référencé par une variable nommé ``view``.
   Et c'est cette référence qui devra être passé à la carte par l'intermédiaire
   de l'option ``view``.
3. Après la création de la carte, agir sur la vue (référencée par la variable
   ``view``) pour recentrer celle-ci sur l'étendue ``[248024.23082580912,
   270955.339311362, 6243887.163136197, 6259174.568793232]``.
4. Changer le code pour que la vue n'ait pas d'état initialement, et pour
   qu'elle ne soit rééllement définie que lorsque qu'elle recentrée sur
   l'étendue spécifiée.
5. Tenter de comprendre pourquoi la fonction ``fitExtent`` a besoin des
   dimensions de la carte en pixels pour faire ce qui lui est demandé.

.. hint::

    * C'est la fonction ``fitExtent`` de ``ol.View2D`` qui doit être utilisée
      pour ça.
    * La fonction ``getSize`` de ``ol.Map`` doit aussi être utilisée pour cette
      exercice.
    * Pensez à jetter un oeil à la doc de l'API
      : http://ol3js.org/en/master/apidoc/.

:ref:`correction-exercice-elementaire-5`
