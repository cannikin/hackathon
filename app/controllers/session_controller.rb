class SessionController < ApplicationController
  
  before_filter :login_required, :only => []
  
  
  def index
    if logged_in?
      if current_user.customer?
        redirect_to customer_path
      else
        redirect_to business_path
      end
    end
  end


  def login
    if params[:card_id].present?
      redirect_to signup_path(:card_id => params[:card_id])
    elsif params[:email].present? and params[:password].present?
      if user = User.where(:email => params[:email], :password => params[:password]).first
        log_in_user user
        if user.customer?
          redirect_to customer_path
        else
          redirect_to business_path
        end
      end
    else
      flash[:notice] = 'Please enter both username and password!'
      render :index
    end
  end


  # signup page
  def new
    if Card.where(:uid => params[:card_id]).any?
      @card = Card.where(:uid => params[:card_id]).first
      @user = User.new
    else
      flash[:notice] = "That card number wasn't found! Please try again."
      redirect_to login_path
    end
  end
  
  # signup page submits here
  def create
    @card = Card.where(:uid => params[:card_id]).first
    @user = User.new params[:user]
    if @user.save
      @user.cards << @card
      log_in_user(@user)
      redirect_to customer_path
    else
      flash[:notice] = 'Please fill in all the fields below!'
      render :new
    end
  end
  
  # logout
  def destroy
    log_out_user
    flash[:notice] = 'You have been logged out. Come back soon!'
    redirect_to login_path
  end

end
