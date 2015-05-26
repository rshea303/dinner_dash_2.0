class UsersController < ApplicationController

  def new
    session[:before_register_url] = request.referrer
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to session[:before_register_url]
    else
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
