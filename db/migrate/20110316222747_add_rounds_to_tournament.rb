class AddRoundsToTournament < ActiveRecord::Migration
  def self.up
  	add_column :tournaments, :rounds_number, :integer,  :default => 9
  end

  def self.down
  	remove_column :tournaments, :rounds_number
  end
end
