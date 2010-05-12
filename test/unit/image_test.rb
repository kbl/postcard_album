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
  
end


# == Schema Information
#
# Table name: images
#
#  id           :integer         not null, primary key
#  image_type   :string(255)
#  file_name    :string(255)
#  content_type :string(255)
#  file_size    :integer
#  postcard_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

