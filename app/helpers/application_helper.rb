# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def postcard_image_tag(postcard, type, options = {})
    # todo normal way.. without if
    if type == :thumbnail
      image_tag(postcard.abverse_image.image.url(postcard.abverse_image.thumbnail_style), options)
    else
      image_tag(postcard.abverse_image.image.url(postcard.abverse_image.normal_style), options)
    end
  end

end
