SimpleNavigation::Configuration.run do |navigation|  

  navigation.items do |primary|
    primary.dom_class = 'sf-menu clear'
    primary.item :index, content_tag(:span, t(:nav_main_page)), root_path
    primary.item :postcards, content_tag(:span, t(:nav_postcards)), postcards_path
    primary.item :publishers, content_tag(:span, t(:nav_publishers)), publishers_path
    primary.item :postcard_sets, content_tag(:span, t(:nav_postcard_sets)), postcard_sets_path
    primary.item :links, content_tag(:span, t(:nav_links)), links_path
    primary.item :contact, content_tag(:span, t(:nav_contact)), contact_path
  end
  
end
