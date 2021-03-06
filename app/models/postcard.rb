class Postcard < ActiveRecord::Base

  acts_as_taggable

  has_many :images, -> { order 'type_of_image' }, dependent: :destroy
  has_many :postcard_set_elements
  has_many :postcard_sets, through: :postcard_set_elements

  belongs_to :publisher

  validates_presence_of :description,
                        :name,
                        :year
  validates_inclusion_of :is_horizontal, in: [true, false]
  validates_size_of :name, maximum: 255
  validates_numericality_of :year, only_integer: true, greater_than: 1800, less_than: 2000

  cattr_reader :per_page
  @@per_page = 12

  accepts_nested_attributes_for :images, allow_destroy: true

  scope :limited, -> (lim) { limit(lim) }
  scope :horizontal, -> { where(is_horizontal: true) }
  scope :most_interesting, -> { horizontal.where(showable_on_main: true).order("created_at") }

  include PostcardAlbum::NormalizedUrls

  def to_param
    "#{id}-#{to_permalink(name)}"
  end

  def is_horizontal
    return true if self[:is_horizontal].nil?
    self[:is_horizontal]
  end

  def is_horizontal?
    is_horizontal
  end

  def orientation
    return :horizontal if is_horizontal?
    :vertical
  end

  def abverse_image
    find_image(Image::IMAGE_TYPES[0])
  end

  def reverse_image
    find_image(Image::IMAGE_TYPES[1])
  end

  def self.search(params)
    relation = Postcard.order('created_at DESC')
    if params[:tag]
      relation = relation.tagged_with(params[:tag])
    end
    relation.paginate(page: params[:page])
  end

  private

  def find_image(image_type)
    Image.where({ postcard_id: id, type_of_image: image_type }).first
  end

end

# == Schema Information
#
# Table name: postcards
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#  is_horizontal :boolean
#  latitude      :string(255)
#  longitude     :string(255)
#  year          :integer
#  publisher_id  :integer
#

