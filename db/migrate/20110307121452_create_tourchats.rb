class CreateTourchats < ActiveRecord::Migration
  def self.up
    create_table :tourchats do |t|
      t.integer :user_id
      t.integer :tournament_id
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :tourchats
  end
end
