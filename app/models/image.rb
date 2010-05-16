class Image < ActiveRecord::Base

  has_attached_file :image,
                    :processors => [:resize, :sign, :add_border],
                    :styles => { 
                        :normal_horizontal => { 
                            :width => 450,
                            :height => 300,
                            :border_inner => 3,
                            :border_outer => 15,
                            :signature => '    marcin.pietraszek.pl '
                        }, 
                        :normal_vertical => { 
                            :width => 300,
                            :height => 450,
                            :border_inner => 3,
                            :border_outer => 15,
                            :signature => '    marcin.pietraszek.pl '
                        }, 
                        :thumbnail_horizontal => {
                            :width => 90,
                            :height => 60,
                            :border_inner => 1,
                            :border_outer => 5
                        },
                        :thumbnail_vertical => {
                            :width => 60,
                            :height => 90,
                            :border_inner => 1,
                            :border_outer => 5
                        }
                    },
                    :path => ':rails_root/public/images/postcards/:id/:style.:extension',
                    :url => '/images/postcards/:id/:style.:extension'


  IMAGE_TYPES = %w[abverse reverse stamp other]

  belongs_to :postcard

  validates_presence_of :type_of_image,
                        :image_file_name,
                        :image_content_type,
                        :image_file_size,
                        :image_updated_at
  validates_associated :postcard
  validates_inclusion_of :type_of_image, :in => Image::IMAGE_TYPES
  validates_attachment_presence :image
  #validates_attachment_size :image, :less_than => 50.kilobytes

  named_scope :abverse, :conditions => { :type_of_image => 'abverse' }



  def thumbnail_style
    "thumbnail_#{postcard.orientation}".to_sym
  end
  
  def normal_style
    "normal_#{postcard.orientation}".to_sym
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
#  is_horizontal      :boolean
#

