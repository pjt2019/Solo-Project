class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_author, only: [:new, :create]

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
    categories = params[:recipe][:categories]
    categories.each do |c|
      @recipe.categories << Category.find(c) unless c.blank?
    end
    @recipe.save
    current_user.recipes << @recipe
    redirect_to categories_path(@category)
    #current_user.recipes << @recipe
    #redirect_to recipes_path(@recipe)
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredient, :instruction, :photo)
  end

  def check_author
    unless current_user.is_author
      flash[:error] = "You must be author to create a recipe"
      redirect_to root_path
    end
  end
end

