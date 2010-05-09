class Image < ActiveRecord::Base

  cattr_reader :image_types
  @@image_types = [:abverse, :reverse, :stamp, :other]

  belongs_to :postcard

  validates_presence_of :image_type,
                        :file_name,
                        :content_type,
                        :file_size,
                        :postcard_id
  validates_inclusion_of :image_type, :in => Image.image_types

end


# == Schema Information
#
# Table name: images
#
#  id           :integer         not null, primary key
#  image_type   :string(255)
#  file_name    :string(255)
#  content_type :string(255)
#  file_size    :integer
#  postcard_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

