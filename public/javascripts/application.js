function remove_image(link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".image_fields").hide();
}

function add_image_fields(link, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_image", "g");
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  }); 
}
