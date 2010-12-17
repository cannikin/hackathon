class TapController < ApplicationController
  
  before_filter :login_required, :only => []
  
  # this is where a device logs a card to
  def go
    device = Device.find_or_create_by_uid(params[:device].downcase)
    card = Card.find_or_create_by_uid(params[:id].downcase)
    hit = Hit.create(:device => device, :card => card)
    
    check_for_rewards(hit)
    
    if card.user
      render :text => "\n#{card.user.first_name} #{card.user.last_name}\n"
    else
      render :text => 'ok'
    end
  end


  private
  
    def check_for_rewards(hit)
      if hit.device.rewards.any?
        hit.device.rewards.each do |reward|
          if reward.on_visit and reward.on_visit == hit.similar.count
            Notification.create! :hit => hit, :reward => reward
          elsif reward.every_visit and hit.similar.count % reward.every_visit == 0
            Notification.create! :hit => hit, :reward => reward
          end
        end
      end
    end
    
end
