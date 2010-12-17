class BusinessController < ApplicationController
  
  def index
    @business = current_user.business
    @rewards = current_user.business.rewards
    @latest_notifications = Notification.where("reward_id in (#{@business.rewards.collect(&:id).join(',')})").order('created_at desc').limit(5)
    @top_hits = User.top[0..5]
  end

end
