class Counter < ActiveRecord::Base
  
  belongs_to :device
  belongs_to :business
  
end
