class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    session[:before_register_url] = request.referrer
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to session[:before_register_url]
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
