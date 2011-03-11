class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.integer :game_id
      t.string :var1
      t.string :var2
      t.string :var3
      t.string :move
      t.float :move_eval
      t.integer :move_number
      t.boolean :white_on_move

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
