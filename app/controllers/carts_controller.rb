class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def edit
  end

  def destroy
    if @cart.destroy
      session[:cart_id] = nil
      flash[:notice] = "Cart emptied!"
      redirect_to shop_path
     else
      flash[:alert] = "Cart could not be emptied :(."
      redirect_to edit_cart_path
    end
  end
end
