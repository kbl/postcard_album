class RemoveReversePathFromPostcards < ActiveRecord::Migration
  def self.up
    remove_column :postcards, :reverse_path
  end

  def self.down
    add_column :postcards, :reverse_path, :string
  end
end
