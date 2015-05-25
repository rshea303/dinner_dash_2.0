class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_cart

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def load_cart
    @cart ||= Cart.new(session[:cart])
  end

  def cart
    @cart
  end
  helper_method :cart

  def require_login
    unless current_user
      redirect_to new_session_path
      flash[:alert] = "Please log in first."
    end
  end
end
