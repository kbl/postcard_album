class CreateImages < ActiveRecord::Migration

  def self.up
    create_table :images do |t|
      t.string :image_type 
      t.string :file_name
      t.string :content_type
      t.integer :file_size
      t.references :postcard

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
  
end
