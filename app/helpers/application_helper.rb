# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def postcard_image_tag(postcard, type, options = {})
    # todo normal way.. without if
    unless abverse = postcard.abverse_image 
      return
    end

    if type == :thumbnail
      image_tag(abverse.image.url(abverse.thumbnail_style), options)
    else
      image_tag(abverse.image.url(abverse.normal_style), options)
    end
  end

end
