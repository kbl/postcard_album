module ApplicationHelper

  include ActsAsTaggableOn::TagsHelper

  def postcard_reverse_image_url(postcard, type)
    # todo normal way.. without if
    unless reverse = postcard.reverse_image
      return
    end

    postcard_image_url(reverse, type)
  end

  def postcard_abverse_image_url(postcard, type)
    # todo normal way.. without if
    unless abverse = postcard.abverse_image
      return
    end

    postcard_image_url(abverse, type)
  end

  def date_added(date)
    buffer = '' << content_tag('span', date.day, class: 'date-aded-day')
    buffer << content_tag('span', l(date, :format => :month), class: 'date-added-month')
    buffer << content_tag('span', date.year, class: 'date-added-year')
    buffer.html_safe
  end

  private 

  def postcard_image_url(postcard_image, type)
    if type == :thumbnail
      postcard_image.image.url(postcard_image.thumbnail_style)
    else
      postcard_image.image.url(postcard_image.normal_style)
    end
  end

end
