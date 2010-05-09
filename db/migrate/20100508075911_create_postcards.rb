class CreatePostcards < ActiveRecord::Migration
  def self.up
    create_table :postcards do |t|
      t.string :name
      t.text :description
      t.date :photo_date

      t.timestamps
    end
  end

  def self.down
    drop_table :postcards
  end
end
