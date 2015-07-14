class SessionsController < ApplicationController
  def new
    redirect_to '/auth/facebook'
  end

  def show
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'], 
        :uid => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
	  # user = User.from_omniauth(env["omniauth.auth"])
	  # session[:user_id] = user.id
	  # redirect_to root_url
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Signed out"
	  # session[:user_id] = nil
	  # redirect_to root_url
  end
end


