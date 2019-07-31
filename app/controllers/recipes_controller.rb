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
    @photo = Photo.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    current_user.recipes << @recipe
    #@category = Category.find(params[:categories])
    #@category.recipes << @recipe
    redirect_to recipes_path(@recipe)
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredient, :instruction, :photo)
  end
end

