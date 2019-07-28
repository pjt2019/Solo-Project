class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = current_user.categories.recipes.create(recipe_params)
    redirect_to recipes_path(@recipe)
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredient, :instruction)
  end
end

