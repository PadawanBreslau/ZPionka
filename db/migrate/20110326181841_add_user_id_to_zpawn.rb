class AddUserIdToZpawn < ActiveRecord::Migration
  def self.up
  	add_column :zpawns, :user_id, :integer
  end

  def self.down
  	remove_column :zpawns, :user_id
  end
end