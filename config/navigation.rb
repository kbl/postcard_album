SimpleNavigation::Configuration.run do |navigation|  

  navigation.items do |primary|
    primary.dom_class = 'sf-menu clear'
    primary.item :index, content_tag(:span, 'strona główna'), '/'
    primary.item :postcards, content_tag(:span, 'widokówki'), postcards_path
    primary.item :contact, content_tag(:span, 'odnośniki'), '/a'
    primary.item :contact, content_tag(:span, 'kontakt'), '/b'
  end
  
end
