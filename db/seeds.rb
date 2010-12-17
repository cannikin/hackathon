# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Device.create :id => 1, :uid => '39ba0f0130'

User.create :id => 1, :first_name => 'Rob', :last_name => 'Cameron', :email => 'cannikinn@gmail.com', :password => 'bosco', :phone => '7606725123'
User.create :id => 2, :first_name => 'Aimee', :last_name => 'Cameron', :email => 'aimee.cameron@active.com', :password => 'bosco'
User.create :id => 3, :first_name => 'Jack', :last_name => 'Cameron', :email => 'jack.cameron@active.com', :password => 'bosco'
User.create :id => 4, :first_name => 'Dave', :last_name => 'Cameron', :email => 'dave.cameron@active.com', :password => 'bosco'
User.create :id => 5, :first_name => 'Gail', :last_name => 'Cameron', :email => 'gail.cameron@active.com', :password => 'bosco'
User.create :id => 6, :first_name => 'Rob', :last_name => 'Cameron', :email => 'rob.cameron@active.com', :password => 'bosco'

Card.create :id => 1, :uid => '0f0302a39f'
Card.create :id => 2, :uid => '0f0302a391'
Card.create :id => 3, :uid => '0f0302a392'
Card.create :id => 4, :uid => '0f0302a393'
Card.create :id => 5, :uid => '0f0302a394'

Business.create :id => 1, :name => 'Running Shack'

Reward.create :id => 1, :value => '10', :title => '10% off your next purchase', :description => "For being such a loyal customer, here's 10% off your next purchase!", :value => "10%", :every_visit => 5, :device_id => 1
Reward.create :id => 2, :value => '20', :title => '20% off your next purchase', :description => "Welcome to the Running Shack! As a thank you for being a new customer take 20% off your next purchase!", :value => "20%", :on_visit => 1, :device_id => 1
Reward.create :id => 3, :value => 'FREE', :title => 'Free pair of running shoes', :description => "For our most dedicated customers - after your 100th visit redeem this coupon for a free pair of running shoes!", :value => "20%", :on_visit => 100, :device_id => 1

Wallet.create :id => 1, :user_id => 1, :card_id => 1, :created_at => 1.week.ago
Wallet.create :id => 2, :user_id => 2, :card_id => 2, :created_at => 1.week.ago
Wallet.create :id => 3, :user_id => 3, :card_id => 3, :created_at => 5.days.ago
Wallet.create :id => 4, :user_id => 4, :card_id => 4, :created_at => 2.days.ago
Wallet.create :id => 5, :user_id => 5, :card_id => 5, :created_at => 1.day.ago

Counter.create :id => 1, :business_id => 1, :device_id => 1

Owner.create :id => 1, :business_id => 1, :user_id => 6

14.times do |i|
  Hit.create :id => i, :card_id => 2, :device_id => 1, :created_at => 1.day.ago
end
Hit.create :id => 15, :card_id => 2, :device_id => 1, :created_at => 4.hours.ago
Notification.create :id => 1, :hit_id => 1, :reward_id => 2, :created_at => 3.days.ago
Notification.create :id => 2, :hit_id => 5, :reward_id => 1, :created_at => 2.days.ago
Notification.create :id => 3, :hit_id => 10, :reward_id => 1, :created_at => 5.hours.ago
Notification.create :id => 4, :hit_id => 15, :reward_id => 1, :created_at => 1.hour.ago

11.times do |i|
  Hit.create :id => i+15, :card_id => 3, :device_id => 1, :created_at => 1.day.ago
end
Hit.create :id => 15+11, :card_id => 3, :device_id => 1, :created_at => 1.day.ago
Notification.create :id => 5, :hit_id => 16, :reward_id => 2, :created_at => 5.days.ago
Notification.create :id => 6, :hit_id => 20, :reward_id => 1, :created_at => 9.hours.ago
Notification.create :id => 7, :hit_id => 25, :reward_id => 1, :created_at => 4.minutes.ago

puts 'create for user 4'
9.times do |i|
  Hit.create :id => i+15+12, :card_id => 4, :device_id => 1, :created_at => 1.day.ago
end
Hit.create :id => 15+11+9, :card_id => 4, :device_id => 1, :created_at => 45.minutes.ago
Notification.create :id => 8, :hit_id => 28, :reward_id => 2, :created_at => 6.days.ago
Notification.create :id => 9, :hit_id => 32, :reward_id => 1, :created_at => 2.days.ago
Notification.create :id => 10, :hit_id => 37, :reward_id => 1, :created_at => 45.minutes.ago

puts 'create for user 5'
6.times do |i|
  Hit.create :id => i+15+12+10, :card_id => 5, :device_id => 1, :created_at => 1.day.ago
end
Hit.create :id => 15+12+9+6, :card_id => 5, :device_id => 1, :created_at => 16.hours.ago
Notification.create :id => 11, :hit_id => 38, :reward_id => 2, :created_at => 1.day.ago
Notification.create :id => 12, :hit_id => 42, :reward_id => 1, :created_at => 15.minutes.ago
