class CreateMovecomments < ActiveRecord::Migration
  def self.up
    create_table :movecomments do |t|
      t.integer :user_id
      t.text :content
      t.integer :move_sign
      t.integer :position_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movecomments
  end
end
