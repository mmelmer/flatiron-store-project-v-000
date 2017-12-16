class CartsController < ApplicationController

  def show
    @current_cart = Cart.find(params[:id])
    #@user = User.last
    #@user.create_current_cart
    #@current_cart = @user.current_cart
  end


  def checkout
    @current_cart = Cart.find(params[:id])
    @user = @current_cart.user
    @current_cart.status = "submitted"
    @current_cart.line_items.each do |li|
      li.update_quantity
    end
    @current_cart.save
    @user.current_cart = nil
    @user.save
      redirect_to cart_path(@current_cart)
  end


end
