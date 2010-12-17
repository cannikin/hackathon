class CreateCounters < ActiveRecord::Migration
  def self.up
    create_table :counters do |t|
      t.integer :business_id
      t.integer :device_id

      t.timestamps
    end
    
    Counter.create :business_id => 1, :device_id => 1
    
  end

  def self.down
    drop_table :counters
  end
end
