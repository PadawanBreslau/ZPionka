class CreateTourplaces < ActiveRecord::Migration
  def self.up
    create_table :tourplaces do |t|
      t.integer :tournament_id
      t.integer :player_id
      t.integer :place
      t.float :points
      t.float :buch
      t.float :mbuch
      t.float :prog
      t.integer :rating_performance
      t.float :k_coeff

      t.timestamps
    end
  end

  def self.down
    drop_table :tourplaces
  end
end
