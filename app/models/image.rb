class Image < ActiveRecord::Base


  SIGNATURE = 'widokowki.pietraszek.pl'

  IMAGE_TYPES = %w[abverse reverse stamp other]
  
  # TODO get rid of 4 styles..
  has_attached_file :image,
                    :processors => [:resize, :sign, :add_border],
                    :styles => { 
                        :normal_horizontal => { 
                            :width => 660,
                            :height => 440,
                            :border_inner => 3,
                            :border_outer => 15,
                            :signature => SIGNATURE
                        }, 
                        :normal_vertical => { 
                            :width => 440,
                            :height => 660,
                            :border_inner => 3,
                            :border_outer => 15,
                            :signature => SIGNATURE
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
                    :path => ':rails_root/postcards/:id/:style.:extension',
                    :url => '/postcards/images/:id/:style.:extension'

  belongs_to :postcard

  validates_presence_of :image_file_name
  validates_associated :postcard
  validates_inclusion_of :type_of_image, :in => Image::IMAGE_TYPES
  validates_attachment_presence :image
  #validates_attachment_size :image, :less_than => 50.kilobytes

  named_scope :abverse, :conditions => { :type_of_image => 'abverse' }



  def thumbnail_style
    style :thumbnail
  end
  
  def normal_style
    style :normal
  end

  
  private

  def style(type)
    if type_of_image == 'reverse'
      "#{type}_horizontal".to_sym
    else
      "#{type}_#{postcard.orientation}".to_sym
    end
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

