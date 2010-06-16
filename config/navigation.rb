SimpleNavigation::Configuration.run do |navigation|  

  navigation.items do |primary|
    primary.dom_class = 'sf-menu clear'
    primary.item :index, content_tag(:span, t(:nav_main_page)), '/'
    primary.item :postcards, content_tag(:span, t(:nav_postcards)), postcards_path
    primary.item :contact, content_tag(:span, t(:nav_links)), '/a'
    primary.item :contact, content_tag(:span, t(:nav_contact)), '/b'
  end
  
end
