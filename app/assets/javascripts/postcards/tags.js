function initTags(url) {
  $('#postcard_tag_list').tagsInput({
    autocomplete_url: url,
    defaultText: 'dodaj tagi',
    width: '735px',
    height: '30px'
  });
}
