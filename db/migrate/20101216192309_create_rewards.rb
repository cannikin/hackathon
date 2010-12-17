class CreateRewards < ActiveRecord::Migration
  def self.up
    create_table :rewards do |t|
      t.string  :title
      t.text    :description
      t.string  :value
      t.integer :on_visit
      t.integer :every_visit
      t.integer :device_id

      t.timestamps
    end    
  end

  def self.down
    drop_table :rewards
  end
end
