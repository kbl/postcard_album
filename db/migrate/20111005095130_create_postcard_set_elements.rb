class CreatePostcardSetElements < ActiveRecord::Migration
  def change
    create_table :postcard_set_elements do |t|
      t.integer :order_number
      t.integer :postcard_id
      t.integer :postcard_set_id

      t.timestamps
    end
  end
end
