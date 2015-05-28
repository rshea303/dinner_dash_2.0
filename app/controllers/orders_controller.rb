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
      order = current_user.orders.create do |order|
        cart.data.each do |item_id, quantity|
          order.line_items.build do |line_item|
            line_item.item_id  = item_id
            line_item.quantity = quantity 
          end
        end
      end
      @order = order
      @order.save
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
