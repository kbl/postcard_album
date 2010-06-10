class Postcard < ActiveRecord::Base

  has_many :images, :dependent => :destroy

  validates_presence_of :description, 
                        :name,
                        :year
  validates_inclusion_of :is_horizontal, :in => [true, false]
  validates_size_of :name, :maximum => 255
  validates_numericality_of :year, :only_integer => true, :greater_than => 1800, :less_than => 2000
  
  cattr_reader :per_page
  @@per_page = 5

  accepts_nested_attributes_for :images, :allow_destroy => true

  named_scope :limited, lambda { |lim| { :limit => lim } }
  named_scope :horizontal, :conditions => {:is_horizontal => true}

  acts_as_taggable

  def self.find_all_paginated(page) 
    paginate(:page => page, :order => 'created_at DESC')
  end

  def orientation
    return :horizontal if is_horizontal?
    :vertical
  end

  def abverse_image
    Image.find_by_postcard_id_and_type_of_image(id, Image::IMAGE_TYPES[0])
  end

end



# == Schema Information
#
# Table name: postcards
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  description   :text
#  photo_date    :date
#  created_at    :datetime
#  updated_at    :datetime
#  is_horizontal :boolean
#  latitude      :string(255)
#  longitude     :string(255)
#

