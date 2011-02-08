class PostcardSet < ActiveRecord::Base

  has_many :postcard_set_positions
  has_many :postcards, :through => :postcard_set_positions

end


# == Schema Information
#
# Table name: postcard_sets
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#
