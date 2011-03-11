class CreateAllowances < ActiveRecord::Migration
  def self.up
    create_table :allowances do |t|
      t.integer :user_id
      t.integer :allowance_level
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :allowances
  end
end
