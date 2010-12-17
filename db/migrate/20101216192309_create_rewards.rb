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
    
    Reward.create :value => '10', :title => '10% off your next purchase', :description => "For being such a loyal customer, here's 10% off your next purchase!", :value => "10%", :every_visit => 5, :device_id => 1
    Reward.create :value => '20', :title => '20% off your next purchase', :description => "Welcome to the Running Shack! As a thank you for being a new customer take 20% off your next purchase!", :value => "20%", :on_visit => 1, :device_id => 1
    Reward.create :value => 'FREE', :title => 'Buy one pair of running shoes, get one free', :description => "For our most dedicated customers - buy one pair of running shoes and get another for free!", :value => "20%", :on_visit => 100, :device_id => 1
    
  end

  def self.down
    drop_table :rewards
  end
end
