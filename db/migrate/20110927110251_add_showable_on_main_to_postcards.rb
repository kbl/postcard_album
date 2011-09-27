class AddShowableOnMainToPostcards < ActiveRecord::Migration
  def change
    add_column :postcards, :showable_on_main, :boolean
  end
end
