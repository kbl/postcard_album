module PostcardsHelper
  
  def link_to_add_image_fields(name, f, editable)
    image = f.object.images.build 
    fields = f.fields_for(:images, image, :child_index => "new_image") do |builder|
      render :partial => 'image_fields', :locals => { :f => builder, :editable => false }
    end
    link_to_function(name, h("addImageFields(this, \"#{escape_javascript(fields)}\")"))
  end
  
  def draw_google_map(postcard, map_clicable)
    latitude = postcard.latitude || -1
    longitude = postcard.longitude || -1
    
    "drawGoogleMap(#{latitude}, #{longitude}, #{map_clicable});"
  end

end
