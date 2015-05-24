class OrdersController < ApplicationController
  def index
  end

  def create
    order = Order.new(user_id: params[:user_id])
    new_line_items = order.create_line_items(session[:cart])
    order.line_items << new_line_items
    @order = order
    @order.save
    @cart.data.clear
    redirect_to user_orders_path(params[:user_id])
  end
end