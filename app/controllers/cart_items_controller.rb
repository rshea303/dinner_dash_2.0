class CartItemsController < ApplicationController
  def create
    cart.add_item(params[:item_id]) 
    session[:cart] = cart.data
    redirect_to menu_path
  end

  def index
  end

  def update
    if params[:modify] == "increase"
      cart.add_item(params[:id])
      redirect_to :back
    else
      cart.decrease_quantity(params[:id])
      redirect_to :back
    end
  end

  def destroy
    session[:cart].delete(params[:id])
    redirect_to :back
  end
end
