class SessionsController < ApplicationController

  def new
    session[:previous_url] = request.referrer
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.admin == true
        redirect_to dashboard_path
      else
        redirect_to session[:previous_url]
      end
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
