function populateChecboxesInSet(url) {
  $.ajax({
    url: url,
    success: function(data) {
      for(var index in data) {
        var postcardId = data[index]
        $('input[value="' + postcardId + '"]').attr('checked', true);
      }
    }
  });
}

function attachPostcardSetsRelatedEvent(url) {
  $('input.postcard-set-checkbox').click(function() {
    var $checkbox = $(this),
      postcardId = $checkbox.val(),
      postcardSelected = !!$checkbox.attr('checked');
    $.ajax({
      url: url,
      data: {
        postcard_id: postcardId,
        include_in_set: postcardSelected
      }
    });
  });
}
