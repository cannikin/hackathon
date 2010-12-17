class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :hit_id
      t.integer :reward_id

      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
