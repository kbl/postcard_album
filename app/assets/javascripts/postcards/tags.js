function initTags() {
  $('#postcard_tag_list').tagsInput({
    autocomplete_url: '#{tags_path}.json',
    defaultText: 'dodaj tagi',
    width: '735px',
    height: '30px'
  });
}
