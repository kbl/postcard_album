require 'test_helper'

class PostcardTest < ActiveSupport::TestCase
 
  test "should return paginated results" do
    (Postcard.per_page + 1).times do
      Factory(:postcard)
    end

    assert Postcard.find_all_paginated(page_number = 1).size == Postcard.per_page, "should return collection with size of page results" end 
end
