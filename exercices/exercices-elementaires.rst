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
              new ol.layer.Tile({
                source: new ol.source.OSM()
              })
            ]
          });
          </script>
      </body>
    </html>


.. note:: Pensez à lire les **indices** !


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
~~~~~~~~~~~~~~~~~~~~~~

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
   être ``'canvas'``.
3. Faire maintenant en sorte que ce soit le *renderer* DOM qui soit utilisé.

:ref:`correction-exercice-elementaire-2`

.. hint:: Pour vérifier quel *renderer* est utilisé vous pouvez effectuer un
    clic droit sur la carte et sélectionner "Inspecter l'élément". Si c'est
    le *renderer* DOM qui est utilisé l'élément inspecté sera une balise
    ``<img>``, sinon ce sera une balise ``<canvas>``. Cette technique
    ne permet pas de distinguer Canvas de WebGL.


.. _exercice-elementaire-3:

Exercice élémentaire 3
~~~~~~~~~~~~~~~~~~~~~~

*Initialiser la vue de la carte*

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-3.html`` par exemple.
2. Modifier l'objet d'options passés au constructeur ``ol.View2D`` pour
   que la vue soit initialisée avec un niveau de zoom égal à 17.
3. Modifier à nouveau l'objet d'options pour que la vue soit initialisée
   avec un centre égal à ``[288074.8449901076, 6247982.515792289]``.
4. Modifier à nouveau l'objet d'options pour que la vue soit pivotée
   (rotation) d'un angle de 45 dans le sens des aiguilles d'une montre.

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
   ``[288074.8449901076, 6247982.515792289]``.
5. Obtenir dans la console la résolution actuelle de la vue.
6. Agir sur la vue pour passer à une résolution 131072.0 fois plus petite que
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
   ``view``) pour recentrer celle-ci sur l'étendue ``[287716.5464200208,
   288433.14356019435, 6247743.650078897, 6248221.38150568]``.
4. Changer le code pour que la vue n'ait pas d'état initial, et pour
   qu'elle ne soit rééllement définie que lorsque qu'elle est recentrée sur
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


.. _exercice-elementaire-6:

Exercice élémentaire 6
~~~~~~~~~~~~~~~~~~~~~~

*Utiliser une autre source de donnée de type OpenStreetMap*

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-6.html`` par exemple.
2. Changer les options de la vue pour centrer la carte sur l'ENSG. (Options
   utilisées dans :ref:`exercice-elementaire-3` par exemple.)
3. Passer au constructeur ``ol.source.OSM`` un objet d'options contenant une
   propriété ``url`` dont la valeur est
   ``http://{a-c}.tile3.opencyclemap.org/landscape/{z}/{x}/{y}.png``.  Voir
   http://www.thunderforest.com/landscape/ pour obtenir des informations sur
   cette source de donnée. Et voir ``OSMOptions`` dans la doc de l'API pour
   connaître toutes les options qui peuvent être passées à ``ol.source.OSM``.
4. Ajouter une attribution à la source pour que les `conditions d'utilisation
   des tuiles OpenCycleMap <http://www.thunderforest.com/terms/>`_ soient
   respectées. Une attribution du type ``<a
   href="http://www.opencyclemap.org">OpenCycleMap</a>`` est
   en accord avec ces conditions.

.. hint:: Regarder l'exemple
    http://ol3js.org/en/master/examples/localized-openstreetmap.html pour
    inspiration.

:ref:`correction-exercice-elementaire-6`


.. _exercice-elementaire-7:

Exercice élémentaire 7
~~~~~~~~~~~~~~~~~~~~~~

*Changer les paramètres d'affichage d'une couche*

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-7.html`` par exemple.
2. Dans l'objet d'options passé au constructor ``ol.layer.Tile`` ajouter
   des propriétés ``opacity``, ``hue``, ``saturation``, ``brightness``, et
   ``contrast``.
3. Dans la console, récupérer une référence sur la couche et changer sa
   visibilité.

.. hint::

    * ``ol.Map`` fournit une fonction ``getLayers``. Cette fonction
      retourne un object de type ``ol.Collection``, qui lui même fournit
      des méthodes pour accéder aux différents objets de la collection.
      Voir la doc de l'API pour plus d'informations.

:ref:`correction-exercice-elementaire-7`


.. _exercice-elementaire-8:

Exercice élémentaire 8
~~~~~~~~~~~~~~~~~~~~~~

*Manipuler les projections*

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-8.html`` par exemple.
2. Dans une console, afficher le centre de la vue.
3. Le système de coordonnée (projection) de ce centre est "EPSG:3857" (connu
   sous le nom de Spherical Mercator). Convertir les coordonnées du centre de
   "EPSG:3857" à "EPSG:4326" (longitude/latitude WGS84).
4. Les coordonnées GPS de l'ENSG sont latitude : 48,8413379,
   longitude : 2,5878203. Modifier le code JavaScript de la page pour
   que la vue soit centrée sur ces coordonnées à l'état initial. Changer
   aussi le zoom à 17 pour un meilleur résultat.

.. hint::

    * La fonction ``ol.proj.transform`` est à utiliser pour transformer
      des coordonnées d'un système de coordonnée à un autre. Voir la doc
      de l'API.

:ref:`correction-exercice-elementaire-8`


.. _exercice-elementaire-9:

Exercice élémentaire 9
~~~~~~~~~~~~~~~~~~~~~~

*Manipuler les controls*

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-9.html`` par exemple.
2. Modifier le code JavaScript de la page de telle façon qu'une échelle
   graphique soit ajoutée à la carte.
3. Modifier la configuration du *control* pour que les unités de
   mesure anglo-saxonnes (inches, feets, miles) soient utilisées plutôt
   que les unités métriques.

.. hint::

    * C'est le *control* ``ol.control.ScaleLine`` qui permet d'ajouter
      une échelle graphique sur la carte.
    * La fonction ``ol.control.defaults`` permet d'obtenir une collection
      (``ol.Collection``) contenant les *controls* par défaut, qui peut
      être étendue avec sa méthode ``extend`` (qui prend un tableau en
      argument).

:ref:`correction-exercice-elementaire-9`


.. _exercice-elementaire-10:

Exercice élémentaire 10
~~~~~~~~~~~~~~~~~~~~~~~

*Manipuler les interactions*

1. Copier le code HTML de base dans un nouveau fichier,
   ``exercice-elementaire-10.html`` par exemple.
2. Modifier le code JavaScript de la page pour ajouter une interaction
   de type ``ol.interaction.DragRotateAndZoom`` à la carte. (C'est
   la touche ``SHIFT`` qui active cette interaction.)

.. hint::

    * La fonction ``ol.interaction.defaults`` permet d'obtenir une collection
      (``ol.Collection``) contenant les *interactions* par défaut, qui peut
      être étendue avec sa méthode ``extend`` (qui prend un tableau en
      argument).

:ref:`correction-exercice-elementaire-10`
