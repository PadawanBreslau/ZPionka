class AddLoginAndDescriptionToAllowances < ActiveRecord::Migration
  def self.up
  	add_column :allowances, :user_login, :string
  end

  def self.down
  	remove_column :allowances, :user_login
  end
end
