class CreatePostcardSetPositions < ActiveRecord::Migration
  def self.up
    create_table :postcard_set_positions do |t|
      t.integer :postcard_id
      t.integer :postcard_set_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :postcard_set_positions
  end
end
