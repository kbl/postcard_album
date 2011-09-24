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

  def date_added(date)
    buffer = '' << content_tag('span', date.day, class: 'date-aded-day')
    buffer << content_tag('span', l(date, :format => :month), class: 'date-added-month')
    buffer << content_tag('span', date.year, class: 'date-added-year')
    buffer.html_safe
  end

end
