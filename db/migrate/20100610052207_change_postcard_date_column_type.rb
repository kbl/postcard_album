class ChangePostcardDateColumnType < ActiveRecord::Migration
  
  def self.up
    add_column :postcards, :year, :integer 
    Postcard.reset_column_information
    say_with_time 'updating postcards' do
      Postcard.all.each do |p|
        p.update_attribute(:year, p.photo_date.year.to_i)
      end
    end
    remove_column :postcards, :photo_date
  end

  def self.down
    add_column :postcards, :photo_date, :date
    Postcard.reset_column_information
    say_with_time ' updating postcards' do
      Postcard.all.each do |p|
        p.update_attribute(:photo_date, Date.new(p.year, 1, 1))
      end
    end
    remove_column :postcards, :year
  end

end
