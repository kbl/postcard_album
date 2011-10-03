class Publisher < ActiveRecord::Base

  has_many :postcards

  validates_presence_of :name
  validates_length_of :name, :maximum => 255

  cattr_reader :per_page
  @@per_page = 12

  include ::NormalizedUrls

  def self.find_all_combobox
    all.sort{|a, b| a.name <=> b.name }.map { |p| [p.name, p.id] }
  end

  def self.search(params)
    Publisher.order('name ASC').page(params[:page])
  end

end



# == Schema Information
#
# Table name: publishers
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

