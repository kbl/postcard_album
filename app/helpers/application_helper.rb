module ApplicationHelper

  include ActsAsTaggableOn::TagsHelper

  def postcard_abverse_image_url(postcard, type)
    # todo normal way.. without if
    unless abverse = postcard.abverse_image
      return
    end

    if type == :thumbnail
      abverse.image.url(abverse.thumbnail_style)
    else
      abverse.image.url(abverse.normal_style)
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
