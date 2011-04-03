class AddPgnFileToRounds < ActiveRecord::Migration
  def self.up
  	add_column :rounds, :pgn_file, :string
  end

  def self.down
  	remove_column :rounds, :pgn_file
  end
end
