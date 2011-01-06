class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at
      t.string :sha1_digest
      t.boolean :public, :default => false
    end
  end

  def self.down
    drop_table :items
  end
end
