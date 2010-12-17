class CreateCounters < ActiveRecord::Migration
  def self.up
    create_table :counters do |t|
      t.integer :business_id
      t.integer :device_id

      t.timestamps
    end
  end

  def self.down
    drop_table :counters
  end
end
