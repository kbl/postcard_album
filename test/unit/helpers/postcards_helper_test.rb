require 'test_helper'

class PostcardsHelperTest < ActionView::TestCase

  test "should return clicable google map" do
    postcard = Factory(:postcard, :longitude => nil, :latitude => nil)
    assert 'drawGoogleMap(-1, -1, true);' == draw_google_map(postcard, true)
  end

  test "should return unclicable google map" do
    postcard = Factory(:postcard, :longitude => 12, :latitude => 65.53)
    assert 'drawGoogleMap(65.53, 12, false);' == draw_google_map(postcard, false)
  end

end
