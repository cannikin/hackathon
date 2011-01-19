class CustomerController < ApplicationController
  
  def index
    @rewards = current_user.hits
    @checkins = current_user.hits[0..4]
  end

end
