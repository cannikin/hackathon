class Business < ActiveRecord::Base
  
  has_many :counters
  has_many :owners
  has_many :devices, :through => :counters
  has_many :users, :through => :owners
  
  
  # all rewards this business offers across all devices
  def rewards
    self.devices.collect(&:rewards).flatten
  end
  
end
