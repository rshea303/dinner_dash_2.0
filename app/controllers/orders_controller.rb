class OrdersController < ApplicationController
  before_action :require_login
  before_action :authorize!

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    if current_user
      order = Order.new(user_id: params[:user_id])
      new_line_items = order.create_line_items(session[:cart])
      order.line_items << new_line_items
      @order = order
      @order.save
      @cart.data.clear
      redirect_to user_orders_path(params[:user_id])
    else
      redirect_to root_path
    end
  end

  private

  def authorize!
    unless current_user.id == params[:user_id].to_i
      flash[:alert] = "Unauthorized access!"
      redirect_to root_path
    end
  end
end
