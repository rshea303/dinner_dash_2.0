class CartItemsController < ApplicationController
  def create
    cart.add_item(params[:item_id]) 
    session[:cart] = cart.data
    item = Item.find(params[:item_id])
    flash[:notice] = "#{item.name} added to cart."
    redirect_to menu_path
  end

  def index
  end

  def update
    if params[:modify] == "increase"
      cart.add_item(params[:id])
      redirect_to :back
    else
      if cart.data[params[:id]] == 1
        session[:cart].delete(params[:id])
        redirect_to :back
      else
        cart.decrease_quantity(params[:id])
        redirect_to :back
      end
    end
  end

  def destroy
    session[:cart].delete(params[:id])
    redirect_to :back
  end
end
