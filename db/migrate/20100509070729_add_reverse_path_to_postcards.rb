class AddReversePathToPostcards < ActiveRecord::Migration
  def self.up
    add_column :postcards, :reverse_path, :string
  end

  def self.down
    remove_column :postcards, :reverse_path
  end
end
