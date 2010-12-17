class Device < ActiveRecord::Base
  
  has_many :rewards
  has_one :counter
  has_one :business, :through => :counter
  has_many :hits
  
end
