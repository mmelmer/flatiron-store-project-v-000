class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @user = User.last
    @category = Category.find_by(params[:id])
  end

end
