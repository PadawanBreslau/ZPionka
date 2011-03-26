class CreateZpawns < ActiveRecord::Migration
  def self.up
    create_table :zpawns do |t|
      t.integer :tournament_id
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :zpawns
  end
end
