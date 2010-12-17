class Notification < ActiveRecord::Base

  belongs_to :hit
  belongs_to :reward

end
