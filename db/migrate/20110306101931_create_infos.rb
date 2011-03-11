class CreateInfos < ActiveRecord::Migration
  def self.up
    create_table :infos do |t|
      t.integer :user_id
      t.string :title
      t.string :lead
      t.text :short_content
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :infos
  end
end
