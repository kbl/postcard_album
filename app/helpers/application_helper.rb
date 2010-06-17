module ApplicationHelper
  
  def postcard_abverse_image_tag(postcard, type, options = {})
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

  def postcard_images_lightbox(images, options)
    images.each do |i|
      link_to i.image.url(i.normal_style), options do
        image_tag i.image.url(i.thumbnail_style)
      end
    end
  end

end
