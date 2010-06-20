class Publisher < ActiveRecord::Base

  has_many :postcards

  validates_presence_of :name,
                        :description
  validates_length_of :name, :maximum => 255

  cattr_reader :per_page
  @@per_page = 5

end

# == Schema Information
#
# Table name: publishers
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

