class CreateNewsletterAccounts < ActiveRecord::Migration
  def self.up
    create_table :newsletter_accounts do |t|
      t.string :email
      t.string :authentication_token
      t.boolean :is_active

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_accounts
  end
end
