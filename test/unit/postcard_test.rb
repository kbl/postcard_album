require 'test_helper'

class PostcardTest < ActiveSupport::TestCase
 
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

  test "should return nil date_from condition" do
    condition = Postcard.date_from_condition({})
    assert condition.nil?
  end

  test "should return date_from condition" do
    condition = Postcard.date_from_condition({:date_from => 123})
    assert condition.first == 'year >= ?'
    assert condition.last == 123
  end

  test "should return nil date_to condition" do
    condition = Postcard.date_to_condition({})
    assert condition.nil?
  end

  test "should return date_to condition" do
    condition = Postcard.date_to_condition({:date_to => 321})
    assert condition.first == 'year <= ?'
    assert condition.last == 321
  end

  test "should return nil publisher_id condition" do
    condition = Postcard.publisher_id_condition({})
    assert condition.nil?
  end

  test "should return publisher_id condition" do
    condition = Postcard.publisher_id_condition({:publisher_id => 3210})
    assert condition.first == 'publisher_id = ?'
    assert condition.last == 3210
  end

  test "should return array with two conditions" do
    condition_parts = Postcard.condition_parts({:date_to => 1, :date_from => 2})
    assert condition_parts.size == 2
    assert condition_parts.include?(['year >= ?', 2])
    assert condition_parts.include?(['year <= ?', 1])
  end

  test "should return condition clauses" do
    condition_clauses = Postcard.condition_clauses({:date_from => 33, :publisher_id => 123, :wrong_param => 666})
    assert condition_clauses.size == 2
    assert condition_clauses.include?('year >= ?')
    assert condition_clauses.include?('publisher_id = ?')
  end

  test "should retur condition options" do
    condition_options = Postcard.condition_options({:publisher_id => 1, :date_from => 2})
    assert condition_options.size == 2
    assert condition_options.include?(1)
    assert condition_options.include?(2)
  end

  test "should return search conditions" do
    conditions = Postcard.conditions({:publisher_id => 123, :date_from => 456})
    assert conditions == ['year >= ? AND publisher_id = ?', 456, 123]
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
#  publisher_id  :integer
#

