class PostcardSet < ActiveRecord::Base

  has_many :postcard_set_elements
  has_many :postcards, through: :postcard_set_elements

  validates_presence_of :description, :title
  validates_inclusion_of :show_abverse, in: [true, false]
  validates_size_of :title, maximum: 255

  accepts_nested_attributes_for :postcard_set_elements, allow_destroy: true

  cattr_reader :per_page
  @@per_page = 4

  include PostcardAlbum::NormalizedUrls

  def to_param
    "#{id}-#{to_permalink(title)}"
  end

  def self.search(params)
    PostcardSet.order('id DESC').paginate(page: params[:page])
  end

end
