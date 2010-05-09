class AddAbversePathToPostcards < ActiveRecord::Migration

  def self.up
    add_column :postcards, :abverse_path, :string
  end

  def self.down
    remove_column :postcards, :abverse_path
  end

end
