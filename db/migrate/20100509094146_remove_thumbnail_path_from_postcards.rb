class RemoveThumbnailPathFromPostcards < ActiveRecord::Migration
  def self.up
    remove_column :postcards, :thumbnail_path
  end

  def self.down
    add_column :postcards, :thumbnail_path, :string
  end
end
