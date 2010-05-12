class Postcard < ActiveRecord::Base

  has_many :images, :dependent => :destroy

  validates_presence_of :description, 
                        :name,
                        :photo_date
  validates_size_of :name, :maximum => 255
  
  cattr_reader :per_page
  @@per_page = 5

  accepts_nested_attributes_for :images

  def self.find_all_paginated(page) 
    paginate(:page => page, :order => 'created_at DESC')
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

