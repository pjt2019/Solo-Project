class Author::RecipesController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipes = Recipe.new
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
    redirect_to author_recipe_path(@recipe)
  end

def show
  @recipe = Recipe.find(params[:id])
end


private

def recipe_params
  params.require(:recipe).permit(:title, :description, :ingredient, :instruction)
end
end
