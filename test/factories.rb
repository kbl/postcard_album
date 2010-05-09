Factory.define :postcard do |postcard|
  postcard.sequence(:description) { |n| "description #{n}" }
  postcard.sequence(:name) { |n| "name #{n}" }
  postcard.photo_date Date.current
end

Factory.define :image do |image|
  image.sequence(:file_name) { |n| "file name #{n}" }
  image.sequence(:file_size) { |n| n }
  image.sequence(:content_type) { |n| "content type #{n}" }
  image.association :postcard
  image.image_type Image::IMAGE_TYPES[rand(Image::IMAGE_TYPES.size)]
end
