class PostcardSetElement < ActiveRecord::Base
  belongs_to :postcard
  belongs_to :postcard_set
end
