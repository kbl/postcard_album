class AddThumbnailPathToPostcards < ActiveRecord::Migration
  def self.up
    add_column :postcards, :thumbnail_path, :string
  end

  def self.down
    remove_column :postcards, :thumbnail_path
  end
end
