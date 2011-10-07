class ChangePostcardSetColumnType < ActiveRecord::Migration

  def up
    remove_column :postcard_sets, :description
    add_column :postcard_sets, :description, :text
  end

  def down
  end

end
