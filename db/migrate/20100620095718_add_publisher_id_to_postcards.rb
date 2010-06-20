class AddPublisherIdToPostcards < ActiveRecord::Migration
  def self.up
    add_column :postcards, :publisher_id, :integer
  end

  def self.down
    remove_column :postcards, :publisher_id
  end
end
