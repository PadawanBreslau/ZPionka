class AddPgnFileToGame < ActiveRecord::Migration
  def self.up
  	add_column :games, :pgn_file, :string
  end

  def self.down
  	remove_column :games, :pgn_file
  end
end
