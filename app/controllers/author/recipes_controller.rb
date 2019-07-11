class Author::RecipesController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipes = Recipe.new
  end

  def create
    @course = current_user.recipes.create(recipe_parama)
    redirect_to author_recipe_path(@course)
end

def show
  @recipe = Recipe.find(params[:id])
end


private

def recipe_params
  params.require(:recipe).permit(:title, :description, :ingredient, :instruction)
end
end
