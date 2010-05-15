Factory.define :postcard do |postcard|
  postcard.sequence(:description) { |n| "description #{n}" }
  postcard.sequence(:name) { |n| "name #{n}" }
  postcard.photo_date Date.current
  postcard.is_horizontal true
end

Factory.define :image do |image|
  image.sequence(:image_file_name) { |n| "file name #{n}" }
  image.sequence(:image_file_size) { |n| n }
  image.sequence(:image_content_type) { |n| "content type #{n}" }
  image.image_updated_at Date.current
  image.association :postcard
  image.type_of_image Image::IMAGE_TYPES[rand(Image::IMAGE_TYPES.size)]
end
