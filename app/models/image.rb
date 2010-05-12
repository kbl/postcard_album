class Image < ActiveRecord::Base

  has_attached_file :image,
                    :processors => [:resize, :sign, :add_border],
                    :styles => { 
                        :horizontal => { 
                            :width => 580,
                            :height => 280,
                            :signature => '    mirek.pietraszek.pl '
                        }, 
                        :vertical => {    
                            :width => 280,
                            :height => 580,
                            :signature => '    mirek.pietraszek.pl '
                        }
                    },
                    :default_style => :horizontal
                    #:path => ':rails_root/public/system/postcards/:postcard_id/:id_:type_of_image.:basename.:extension',
                    #:url => '/postcards_images/:postcard_id/:id_:type_of_image.:basename.:extension'


  IMAGE_TYPES = %w[abverse reverse stamp other]

  belongs_to :postcard

  validates_presence_of :type_of_image,
                        :image_file_name,
                        :image_content_type,
                        :image_file_size,
                        :image_updated_at
  validates_inclusion_of :type_of_image, :in => Image::IMAGE_TYPES

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

