class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.string :title
      t.text :message
      t.boolean :was_read, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
