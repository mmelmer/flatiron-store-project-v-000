class LineItemsController < ApplicationController

  def create
    @user = User.last
    if @user.current_cart == nil
      @user.create_current_cart
      @user.save
    end
    @line_item = @user.current_cart.add_item(params[:item_id])
    if @line_item.save
    #   @line_item.quantity +=1
    # else
    #   @line_item = @user.current_cart.line_items.build(item_id: item_id)
    # end
    # item = Item.find(params[:item_id])
    # @line_item.items << item # unless @user.current_cart.items.include?(item)
    # @line_item.save
    # @user.save
      redirect_to cart_path(@user.current_cart)
    else
      redirect_to store_path
    end
  end

end
