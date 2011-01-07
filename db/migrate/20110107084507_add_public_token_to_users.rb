class AddPublicTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :public_token, :string
    remove_column :items, :public
  end

  def self.down
    add_column :items, :public, :boolean, :default => false
    remove_column :users, :public_token
  end
end
