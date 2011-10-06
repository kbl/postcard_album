class CreatePostcardSets < ActiveRecord::Migration
  def change
    create_table :postcard_sets do |t|
      t.string :description
      t.boolean :show_abverse

      t.timestamps
    end
  end
end
