class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :tournament_id
      t.integer :round_number
      t.date :round_date
      t.boolean :isFinished

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
