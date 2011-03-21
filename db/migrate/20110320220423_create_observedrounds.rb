class CreateObservedrounds < ActiveRecord::Migration
  def self.up
    create_table :observedrounds do |t|
      t.integer :user_id
      t.integer :tournament_id
      t.integer :round_id

      t.timestamps
    end
  end

  def self.down
    drop_table :observedrounds
  end
end
