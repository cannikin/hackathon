class User < ActiveRecord::Base
  
  has_many :wallets
  has_many :cards, :through => :wallets
  has_one :owner
  has_one :business, :through => :owner
  
  
  # returns top customers by number of hits
  def self.top
    Hit.connection.execute('select card_id, count(*) as total from hits total group by card_id order by total desc')
  end
  
  # user's first and last name
  def name
    "#{self.first_name} #{self.last_name}"
  end
  
  
  # user is a customer if they have cards
  def customer?
    self.cards.any?
  end
  
  
  # user is an owner if they have businesses
  def owner?
    self.businesses.any?
  end
  
  
  # array of hits this user has through their cards' checkins
  def hits
    Hit.where("card_id in (#{self.cards.collect(&:id).join(',')})").order('created_at desc')
  end
  
  
  # array of rewards this user has won through their hits
  def rewards
    self.hits.collect(&:rewards).flatten
  end
  
  
end
