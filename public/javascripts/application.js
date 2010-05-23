function remove_image(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".image_fields").hide();
}

function add_image_fields(link, content) {
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
  if (GBrowserIsCompatible()) { 
    var map = new GMap2(document.getElementById("map"));
    map.addControl(new GLargeMapControl());
    map.addControl(new GMapTypeControl());
    latLng = new GLatLng(latitude, longitude)
    map.setCenter(latLng, 16);
    map.enableScrollWheelZoom(); 
    map.addOverlay(new GMarker(latLng));
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
          continuous: true})
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
