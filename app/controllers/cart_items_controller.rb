class CartItemsController < ApplicationController
  def create
    cart.add_item(params[:item_id]) 
    session[:cart] = cart.data
    redirect_to menu_path
  end

  def index
  end

  def update
    cart.increase_quantity(params[:id])
    redirect_to :back
  end
end
