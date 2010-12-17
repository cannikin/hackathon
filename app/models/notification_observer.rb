class NotificationObserver < ActiveRecord::Observer
  
  # Twilio AccountSid and AuthToken
  ACCOUNT_SID = 'ACe05457154ff9016641e1063a8d9ecf86'
  ACCOUNT_TOKEN = '764e4d23a040f4efa49557d023678d9a'

  # Outgoing Caller ID previously validated with Twilio
  FROM = '4155992671';

  def after_create(notification)
    if notification.hit.card.user
      account = Twilio::RestAccount.new(ACCOUNT_SID, ACCOUNT_TOKEN)
      response = account.request("/2010-04-01/Accounts/#{ACCOUNT_SID}/SMS/Messages",'POST',{'From' => FROM, 'To' => notification.hit.card.user.phone, 'Body' => "From #{notification.reward.device.business.name}: You just earned #{notification.reward.title}"})
      puts response.inspect
    end
  end
      
end