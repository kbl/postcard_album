function removeImage(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".image_fields").hide();
}

function addImageFields(link, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_image", "g");
  $(link).parent().before(content.replace(regexp, new_id)); 
}

// functions used with google maps
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
    map.enableScrollWheelZoom(); 
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

// function used to set up a shadowbox in _postcard template
function setUpShadowbox() {
  Shadowbox.init(
    { skipSetup: true}, 
    function() {
      Shadowbox.setup(
        'a.lightbox', 
        { gallery: 'postcards',
          continuous: true});
  });
}

// function usetd on main page with slider
function setUpSlider() {
  $('#slider').easySlider({
    auto: true,
    continuous: true,
    controlsShow: false,
    speed: 800,
    pause: 2400
  });
}
