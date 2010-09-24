Factory.define :postcard do |postcard|
  postcard.sequence(:description) { |n| "description #{n}" }
  postcard.sequence(:name) { |n| "name #{n}" }
  postcard.year 1800 + rand(200)
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

Factory.define :publisher do |publisher|
  publisher.sequence(:name) { |n| "publisher name #{n}" }
end

Factory.define(:newsletter_account) do |account|
  
end
