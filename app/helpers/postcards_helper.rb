module PostcardsHelper
  
  def link_to_add_image_fields(f, options)
    image = f.object.images.build 
    fields = f.fields_for(:images, image, :child_index => "new_image") do |builder|
      render :partial => 'image_fields', :locals => { :f => builder, :editable => options[:editable] }
    end
    link_to_function(options[:name], "addImageFields(this, \"#{escape_javascript(fields)}\")")
  end
  
  def draw_google_map(postcard, map_clicable)
    latitude = postcard.latitude || -1
    longitude = postcard.longitude || -1
    
    # TODO get rid of double assignment
    latitude = -1 if latitude.blank?
    longitude = -1 if longitude.blank?
    
    "drawGoogleMap(#{latitude}, #{longitude}, #{map_clicable});"
  end

end
