class Card < ActiveRecord::Base
  
  has_one :wallet
  has_one :user, :through => :wallet
  has_many :hits
  
end
