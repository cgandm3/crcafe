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


# class SessionsController < ApplicationController
#   def create
#     @user = User.from_omniauth(request.env['omniauth.auth'])
#     session[:user_id] = @user.id
#     flash[:success] = "Welcome, #{@user.name}!"
#     @user.save
#     redirect_to root_path
#   end

#   def destroy
#     if current_user
#       session.delete(:user_id)
#     end
#     flash[:notice] = "See you!"
#     redirect_to root_path
#   end

# end