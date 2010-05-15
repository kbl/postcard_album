class Image < ActiveRecord::Base

  has_attached_file :image,
                    :processors => [:resize, :sign, :add_border],
                    :styles => { 
                        :normal => { 
                            :width => 450,
                            :height => 300,
                            :border_inner => 3,
                            :border_outer => 15,
                            :is_horizontal => Proc.new { |instance| instance.is_horizontal? },
                            :signature => '    marcin.pietraszek.pl '
                        }, 
                        :thumbnail => {
                            :width => 90,
                            :height => 60,
                            :border_inner => 1,
                            :border_outer => 5,
                            :is_horizontal => Proc.new { |instance| instance.is_horizontal? }
                        }
                    },
                    :path => ':rails_root/public/img/postcards/:id/:style.:extension',
                    :url => '/img/postcards/:id/:style.:extension'


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
  validates_attachment_size :image, :less_than => 50.kilobytes

  named_scope :abverse, :conditions => { :type_of_image => 'abverse' }

  def is_horizontal?
    postcard.is_horizontal?
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

