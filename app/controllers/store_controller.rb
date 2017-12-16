class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all 
    @user = User.last
  end
  
end
