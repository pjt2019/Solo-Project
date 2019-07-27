class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = current_user.categories.create(categories_params)
    redirect_to root_path 
  end

  def index
    @categories = Category.all
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end
end


