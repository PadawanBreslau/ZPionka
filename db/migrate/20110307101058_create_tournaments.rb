class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
      t.string :name
      t.string :place
      t.date :start_date
      t.date :finish_date
      t.integer :prizes
      t.integer :time_control
      t.boolean :isFinished, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :tournaments
  end
end
