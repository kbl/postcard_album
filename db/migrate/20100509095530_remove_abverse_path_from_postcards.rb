class RemoveAbversePathFromPostcards < ActiveRecord::Migration
  def self.up
    remove_column :postcards, :abverse_path
  end

  def self.down
    add_column :postcards, :abverse_path, :string
  end
end
