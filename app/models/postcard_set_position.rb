class PostcardSetPosition < ActiveRecord::Base

  belongs_to :postcard
  belongs_to :postcard_set

end


# == Schema Information
#
# Table name: postcard_set_positions
#
#  id              :integer         not null, primary key
#  postcard_id     :integer
#  postcard_set_id :integer
#  position        :integer
#  created_at      :datetime
#  updated_at      :datetime
#

