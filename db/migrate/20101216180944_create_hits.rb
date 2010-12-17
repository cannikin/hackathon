class CreateHits < ActiveRecord::Migration
  def self.up
    create_table :hits do |t|
      t.integer :device_id
      t.integer :card_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hits
  end
end
