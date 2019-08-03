class PhotosController < ApplicationController
  def create
    @recipes = Recipe.find(params[:recipe_id])
  end

  private

  def photo_params
    params.require(:photo).permit(:picture)
  end
end
