function createMarker(point, html) {
  var marker = new GMarker(point);
  GEvent.addListener(marker, "click", function() {
    marker.openInfoWindowHtml(html);
  });
  return marker;
}

function drawGoogleMap(latitude, longitude) {
  drawGoogleMap(latitude, longitude, false);
}

function drawGoogleMap(latitude, longitude, enableClicking) {
  var lastMarker;
  if (GBrowserIsCompatible()) { 
    var map = new GMap2(document.getElementById("map"));
    map.addControl(new GLargeMapControl());
    map.addControl(new GMapTypeControl());
    if(latitude == -1) {
      // townhall in olesnica
      latLng = new GLatLng(51.209645, 17.379599);
    }
    else {
      latLng = new GLatLng(latitude, longitude);
      lastMarker = new GMarker(latLng);
      map.addOverlay(lastMarker);
    }
    map.setCenter(latLng, 16);
    
    if(enableClicking) {
      GEvent.addListener(map, "click", function(overlay, latlng, overlaylatlng) {
        if(lastMarker != null) {
          map.removeOverlay(lastMarker);
        }
        lastMarker = new GMarker(latlng);
        map.addOverlay(lastMarker);
        $("#latitude").val(latlng.lat());
        $("#longitude").val(latlng.lng());
      });
    }
  }
}
