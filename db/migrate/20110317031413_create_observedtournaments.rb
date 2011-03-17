class CreateObservedtournaments < ActiveRecord::Migration
  def self.up
    create_table :observedtournaments do |t|
      t.integer :tournament_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :observedtournaments
  end
end
