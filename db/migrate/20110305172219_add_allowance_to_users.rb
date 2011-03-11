class AddAllowanceToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :allowance, :integer,  :default => 1
  end

  def self.down
     remove_column :users, :allowance
  end
end
