require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  
  test "shouldnt write without image type" do
    image = Factory.build(:image, :type_of_image => nil)

    assert !image.valid?
  end

  test "shouldnt write without file name" do
    image = Factory.build(:image, :image_file_name => nil)

    assert !image.valid?
  end
  
  test "shouldnt write without content type" do
    image = Factory.build(:image, :image_content_type => nil)

    assert !image.valid?
  end

  test "shouldnt write without file size" do
    image = Factory.build(:image, :image_file_size => nil)

    assert !image.valid?
  end

  test "shouldnt write without updated ad" do
    image = Factory.build(:image, :image_updated_at => nil)

    assert !image.valid?
  end

  test "image type should contain certain set of symbols" do
    valid_image_types = %w[abverse reverse stamp other]
    assert Image::IMAGE_TYPES & valid_image_types == valid_image_types
  end

  test "shouldn save with wrong image type" do
    image = Factory.build(:image, :type_of_image => :wrong_image_type)

    assert !image.valid?
  end 

  test "should find only abverse images" do
    2.times { Factory(:image, :type_of_image => 'reverse') }
    2.times { Factory(:image, :type_of_image => 'abverse') }

    abverses = Image.abverse
    assert_not_nil abverses
    assert abverses.size >= 2
    assert abverses.select { |a| a.type_of_image != 'abverse' }.empty?
  end
  
end





# == Schema Information
#
# Table name: images
#
#  id                 :integer         not null, primary key
#  type_of_image      :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  postcard_id        :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_updated_at   :datetime
#

