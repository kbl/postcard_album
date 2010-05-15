require 'test_helper'

class PostcardTest < ActiveSupport::TestCase
 
  test "should return paginated results" do
    (Postcard.per_page + 1).times do
      Factory(:postcard)
    end

    assert Postcard.find_all_paginated(page_number = 1).size == Postcard.per_page, "should return collection with size of page results" 
  end 

  test "shouldn save without is_horizontal flag" do
    postcard = Factory.build(:postcard, :is_horizontal => nil)

    assert !postcard.valid?
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

