class CreateGamechats < ActiveRecord::Migration
  def self.up
    create_table :gamechats do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :gamechats
  end
end
