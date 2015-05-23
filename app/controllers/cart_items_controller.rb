class CartItemsController < ApplicationController
  def create
    cart.add_item(params[:item_id]) 
    session[:cart] = cart.data
    redirect_to menu_path
  end

  def index
  end

end
