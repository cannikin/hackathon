class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string :uid
      t.timestamps
    end
    
    Device.create :uid => '39ba0f0130'
  end

  def self.down
    drop_table :devices
  end
end

# work location: 32.90600119918145, -117.20972299575806