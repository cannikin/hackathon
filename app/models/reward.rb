class Reward < ActiveRecord::Base
  
  belongs_to :device
  has_many :notifications
  has_many :hits, :through => :notifications
  
end
