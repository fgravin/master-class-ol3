var raster = new ol.layer.Tile({
  source: new ol.source.MapQuest({
    layer: 'sat'
  })
});

var vector = new ol.layer.Vector({
  source: new ol.source.GeoJSON({
    projection: 'EPSG:3857',
    url: 'data/countries.json'
  }),
  style: new ol.style.Style({
    fill: new ol.style.Fill({
      color: 'rgba(255,255,255,0.2)'
    }),
    stroke: new ol.style.Stroke({
      color: '#bada55',
      width: 2
    })
  })
});

var map = new ol.Map({
  layers: [raster, vector],
  renderer: 'canvas',
  target: 'map',
  view: new ol.View({
    center: [0, 0],
    zoom: 2
  })
});

var popup = new ol.Overlay({
  element: document.getElementById('popup')
});
map.addOverlay(popup);

$(map.getViewport()).on('mousemove', function(evt) {
  var coordinate = map.getEventCoordinate(evt.originalEvent);
  var pixel = map.getEventPixel(evt.originalEvent);
  var feature = map.forEachFeatureAtPixel(pixel, function(feature, layer) {
    return feature;
  });
  var element = popup.getElement();
  $(element).popover('destroy');
  if (feature) {
    var name = feature.get('name');
    popup.setPosition(coordinate);
    $(element).popover({
      placement: 'top',
      animation: false,
      html: true,
      content: name
    });
    $(element).popover('show');
  }
});

//map.on('mousemove', function(evt) {
  //map.getFeatureInfo({
    //pixel: evt.getPixel(),
    //layers: [vector],
    //success: function(features) {
      //var info = [];
      //for (var i = 0, ii = features.length; i < ii; ++i) {
        //info.push(features[i].get('i'));
      //}
      //var element = popup.getElement();
      //var coordinate = evt.getCoordinate();
      //popup.setPosition(coordinate);
      //$(element).popover('destroy');
      //$(element).popover({
        //'placement': 'top',
        //'animation': false,
        //'html': true,
        //'content': info.join(', ')
      //});
      //$(element).popover(info.length ? 'show' : 'hide');
    //}
  //});
//});

