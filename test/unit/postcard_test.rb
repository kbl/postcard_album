require 'test_helper'

class PostcardTest < ActiveSupport::TestCase
 
  test "should return paginated results" do
    (Postcard.per_page + 1).times do
      Factory(:postcard)
    end

    assert Postcard.find_all_paginated(page_number = 1).size == Postcard.per_page, "should return collection with size of page results" 
  end 

  test "should not save poscard with year before 1800" do
    postcard = Factory.build(:postcard, :year => 1799)
    
    assert !postcard.valid?
  end
  
  test "should not save postcard with year after 2000" do
    postcard =  Factory.build(:postcard, :year => 2010)

    assert !postcard.valid?
  end

  test "should save postcard made by factory" do
    postcard = Factory(:postcard)
    assert postcard.valid?
  end

  test "shuould be horizontal by default" do
    p = Postcard.new
    assert p.is_horizontal
    assert p.is_horizontal?
  end

  test "should cound is_horizontal assigment" do
    p = Postcard.new
    p.is_horizontal = false
    assert !p.is_horizontal
    assert !p.is_horizontal?
  end

  test "should return horizontal orientation" do
    p = Factory(:postcard, :is_horizontal => true)
    assert :horizontal == p.orientation
  end

  test "should return vertical orientation" do
    p = Factory(:postcard, :is_horizontal => false)
    assert :vertical == p.orientation
  end

end




# == Schema Information
#
# Table name: postcards
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#  is_horizontal :boolean
#  latitude      :string(255)
#  longitude     :string(255)
#  year          :integer
#

