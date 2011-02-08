class Postcard < ActiveRecord::Base

  acts_as_taggable

  has_many :images, :dependent => :destroy, :order => 'type_of_image'
  has_many :postcard_set_positions
  has_many :postcard_sets, :through => :postcard_set_positions
  belongs_to :publisher

  validates_presence_of :description, 
                        :name,
                        :year
  validates_inclusion_of :is_horizontal, :in => [true, false]
  validates_size_of :name, :maximum => 255
  validates_numericality_of :year, :only_integer => true, :greater_than => 1800, :less_than => 2000
  
  cattr_reader :per_page
  @@per_page = 5

  accepts_nested_attributes_for :images, :allow_destroy => true

  scope :limited, lambda { |lim| { :limit => lim } }
  scope :horizontal, where(:is_horizontal => true)
  
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
    Image.find_by_postcard_id_and_type_of_image(id, Image::IMAGE_TYPES[0])
  end

  def self.search(params)
    Postcard.paginate(:page => params[:page], :conditions => conditions(params), :order => 'created_at DESC')
  end


  private

  def self.date_from_condition(params)
    ['year >= ?', params[:date_from]] unless params[:date_from].blank?
  end

  def self.date_to_condition(params)
    ['year <= ?', params[:date_to]] unless params[:date_to].blank? 
  end

  def self.publisher_id_condition(params)
    ['publisher_id = ?', params[:publisher_id]] unless params[:publisher_id].blank?
  end

  def self.conditions(params)
    [condition_clauses(params).join(' AND '), *condition_options(params)]
  end

  def self.condition_options(params)
    condition_parts(params).inject([]) { |result, element| result << element.last }  
  end

  def self.condition_clauses(params)
    condition_parts(params).inject([]) { |result, element| result << element.first }  
  end


  def self.condition_parts(params)
    methods.grep(/_condition$/).map do |method|
      send(method, params)
    end.compact
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

