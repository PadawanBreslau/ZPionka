class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name
      t.string :surname
      t.integer :rating, :default => 1000
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
