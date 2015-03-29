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
  if(latitude == -1) {
    // townhall in olesnica
    center = new google.maps.LatLng(51.209645, 17.379599);
  }
  else {
    center = new google.maps.LatLng(latitude, longitude);
  }

  mapOptions = {
    zoom: 16,
    center: center
  }

  map = new google.maps.Map(document.getElementById("map"), mapOptions);

  var centerMarker = null;

  if(latitude != -1) {
    centerMarker = new google.maps.Marker({
      map: map,
      position: center
    });
  }

  if(enableClicking) {
    google.maps.event.addListener(map, 'click', function(e) {
      if(centerMarker != null) {
        centerMarker.setPosition(e.latLng);
      }
      else {
        centerMarker = new google.maps.Marker({
          map: map,
          position: e.latLng
        });
      }
      $("#latitude").val(e.latLng.lat());
      $("#longitude").val(e.latLng.lng());
    });
  }
}
