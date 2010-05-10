class RenameColumnsInImages < ActiveRecord::Migration

  def self.up
    rename_column :images, :image_type, :type_of_image
    rename_column :images, :file_name, :image_file_name
    rename_column :images, :content_type, :image_content_type
    rename_column :images, :file_size, :image_file_size
    add_column :images, :image_updated_at, :datetime
  end

  def self.down
    rename_column :images, :type_of_image, :image_type 
    rename_column :images, :image_file_name, :file_name 
    rename_column :images, :image_content_type, :content_type 
    rename_column :images, :image_file_size, :file_size 
    remove_column :images, :image_updated_at
  end
  
end
