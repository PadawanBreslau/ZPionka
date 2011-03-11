class CreateObserves < ActiveRecord::Migration
  def self.up
    create_table :observes do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end

  def self.down
    drop_table :observes
  end
end
