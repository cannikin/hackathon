class Hit < ActiveRecord::Base
  
  belongs_to :card
  belongs_to :device
  has_one :notification
  has_one :reward, :through => :notification
  
  
  # returns other hits for the same card/device combo
  def similar
    Hit.where(:card_id => self.card_id, :device_id => self.device_id)
  end
  
  
end
