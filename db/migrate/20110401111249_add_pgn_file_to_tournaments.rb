class AddPgnFileToTournaments < ActiveRecord::Migration
  def self.up
  	add_column :tournaments, :pgn_file, :string
  end

  def self.down
  	remove_column :tournaments, :pgn_file
  end
end
