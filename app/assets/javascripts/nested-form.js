function removeImage(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".image_fields").hide();
}

function addImageFields(link, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_image", "g");
  $(link).parent().before(content.replace(regexp, new_id));
}
