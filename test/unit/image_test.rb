require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  
  test "shouldnt write without image type" do
    image = Factory.build(:image, :image_type => nil)

    assert !image.valid?
  end

  test "shouldnt write without file name" do
    image = Factory.build(:image, :file_name => nil)

    assert !image.valid?
  end
  
  test "shouldnt write without content type" do
    image = Factory.build(:image, :content_type => nil)

    assert !image.valid?
  end

  test "shouldnt write without file size" do
    image = Factory.build(:image, :file_size => nil)

    assert !image.valid?
  end

  test "shouldnt write without referenced postcard" do
    image = Factory.build(:image, :postcard_id => nil)

    assert !image.valid?
  end

  test "image type should contain certain set of symbols" do
    valid_image_types = [:abverse, :reverse, :stamp, :other]
    assert Image.image_types & valid_image_types == valid_image_types
  end

  test "shouldn save with wrong image type" do
    image = Factory.build(:image, :image_type => :wrong_image_type)

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

