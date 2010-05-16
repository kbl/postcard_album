class Postcard < ActiveRecord::Base

  has_many :images, :dependent => :destroy

  validates_presence_of :description, 
                        :name,
                        :photo_date
  validates_inclusion_of :is_horizontal, :in => [true, false]
  validates_size_of :name, :maximum => 255
  
  cattr_reader :per_page
  @@per_page = 3

  accepts_nested_attributes_for :images, :allow_destroy => true

  acts_as_taggable

  def self.find_all_paginated(page) 
    paginate(:page => page, :order => 'created_at DESC')
  end

  def orientation
    return :horizontal if is_horizontal?
    :vertical
  end

  def abverse_image
    Image.find_by_postcard_id_and_type_of_image(id, 'abverse')
  end

end


# == Schema Information
#
# Table name: postcards
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  photo_date  :date
#  created_at  :datetime
#  updated_at  :datetime
#

