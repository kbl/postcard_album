class AddLatitudeLongitudeToPostcards < ActiveRecord::Migration
  def self.up
    add_column :postcards, :latitude, :string
    add_column :postcards, :longitude, :string
  end

  def self.down
    remove_column :postcards, :longitude
    remove_column :postcards, :latitude
  end
end
