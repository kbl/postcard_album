module PostcardsHelper
  
  def link_to_add_image_fields(name, f)
    image = f.object.images.build 
    fields = f.fields_for(:images, image, :child_index => "new_image") do |builder|
      render("image_fields", :f => builder)
    end
    link_to_function(name, h("add_image_fields(this, \"#{escape_javascript(fields)}\")"))
  end

end
