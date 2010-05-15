class AddIsHorizontalToPostcards < ActiveRecord::Migration
  def self.up
    add_column :postcards, :is_horizontal, :boolean
  end

  def self.down
    remove_column :postcards, :is_horizontal
  end
end
