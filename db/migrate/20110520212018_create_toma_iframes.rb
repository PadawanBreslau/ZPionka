class CreateTomaIframes < ActiveRecord::Migration
  def self.up
    create_table :tomaiframes do |t|
      t.string :url
      t.integer :width
      t.integer :height
      t.integer :frameborder, :default => "0"
      t.boolean :scrolling, :default => "false"
      t.integer :marginwidth, :default => "0"
      t.integer :marginheight, :default => "0"
      t.text :optional_code
      t.boolean :is_finished, :default => false
      t.string :tournament_name
      t.integer :tournament_id
      t.text :broadcast_info

      t.timestamps
    end
  end

  def self.down
    drop_table :tomaiframes
  end
end
