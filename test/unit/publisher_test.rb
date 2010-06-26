require 'test_helper'

class PublisherTest < ActiveSupport::TestCase

  test "shouldnt save without name" do
    publisher = Factory.build(:publisher, :name => nil)
    assert !publisher.valid?
  end

  test "should retur array [name, id] of publishers" do
    3.times { Factory(:publisher) }
    publisher_list = Publisher.find_all_combobox

    result = publisher_list.inject(true) do |result, current|
      result and current.size == 2 and current.last.integer?
    end
    assert publisher_list.size >= 3
    assert result
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

