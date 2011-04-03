class AddFenToPositions < ActiveRecord::Migration
  def self.up
  	add_column :positions, :fen, :string
  end

  def self.down
  	remove_column :positions, :fen
  end
end
