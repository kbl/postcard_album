class AddTitleToPostcardSets < ActiveRecord::Migration
  def change
    add_column :postcard_sets, :title, :string
  end
end
