//= require tinymce-jquery
//= require ./utils/tiny_mce_utils

function toggleSubscribersList() {
  $('#show-hide-subscribers').click(
    function() {
      $('#subscribers').slideToggle('slow');
    }
  );
}
