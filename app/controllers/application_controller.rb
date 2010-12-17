class ApplicationController < ActionController::Base
  
  before_filter :login_required
  
  helper_method :current_user, :logged_in?
  
  private
  
    def current_user
      if logged_in?
        return User.find(session[:user_id])
      else
        return nil
      end
    end
  
    def login_required
      redirect_to login_path unless logged_in?
    end
  
    def logged_in?
      session[:user_id].present?
    end
  
    def log_in_user(user)
      session[:user_id] = user.id
    end
    
    def log_out_user
      session[:user_id] = nil
    end
    
end
