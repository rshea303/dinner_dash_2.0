class UsersController < ApplicationController

  def new
    session[:before_register_url] = request.referrer
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      determine_redirect
    else
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def determine_redirect
    if session[:before_register_url] == new_session_path
      redirect_to session[:previous_url]
    else
      redirect_to session[:before_register_url]
    end
  end
end
