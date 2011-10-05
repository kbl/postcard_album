class PostcardSet < ActiveRecord::Base

  has_many :postcard_set_elements
  has_many :postcards, through: :postcard_set_elements

  validates_presence_of :description
  validates_inclusion_of :show_abverse, in: [true, false]

  accepts_nested_attributes_for :postcard_set_elements, allow_destroy: true

  cattr_reader :per_page
  @@per_page = 4

  def self.search(params)
    PostcardSet.order('id DESC').paginate(page: params[:page])
  end

end
