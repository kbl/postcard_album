Factory.define :postcard do |postcard|
  postcard.sequence(:description) { |n| "description #{n}" }
  postcard.sequence(:name) { |n| "name #{n}" }
  postcard.photo_date Date.current
end
