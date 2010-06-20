require 'test_helper'

class PublisherTest < ActiveSupport::TestCase

  test "shouldnt save without name" do
    publisher = Factory.build(:publisher, :name => nil)
    assert !publisher.valid?
  end

  test "shouldnt save without description" do
    publisher = Factory.build(:publisher, :description => nil)
    assert !publisher.valid?
  end

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

