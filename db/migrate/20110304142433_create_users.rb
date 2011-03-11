class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :name
      t.string :surname
      t.integer :age
      t.integer :rating
      t.text :about

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
