class CookbooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @photo = Photo.new
  end

  def create
    current_user.cookbooks.create(recipe: current_recipe)
    redirect_to cookbook_path(current_recipe)
  end

  def add_recipe
    current_user.cookbook.recipes << Recipe.find(params[:recipe])
    redirect_to cookbook_path(current_user.cookbook.recipes.last.categories.last)

    #Find the recipe from the URL
    #add the recipe to the cookbook
    #redirect to cookbook show page
  end

  private

  def current_recipe
    @current_recipe ||= Recipe.find(params[:recipe_id])
  end
end
