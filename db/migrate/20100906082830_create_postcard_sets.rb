class CreatePostcardSets < ActiveRecord::Migration
  def self.up
    create_table :postcard_sets do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :postcard_sets
  end
end
