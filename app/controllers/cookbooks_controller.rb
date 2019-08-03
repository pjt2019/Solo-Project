class CookbooksController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @photo = Photo.new
  end
end
