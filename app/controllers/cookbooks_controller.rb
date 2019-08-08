class CookbooksController < ApplicationController
  before_action :authenticate_user!
  def index
    #give the new cookbook to the current user
    if current_user.cookbook.nil?
      new_cookbook = Cookbook.create(:user_id => current_user)
      current_user.cookbook = new_cookbook      
    end      
    all_recipes = current_user.cookbook.recipes
    all_categories = []
    all_recipes.each do |recipe|
      recipe.categories.each do |category|
        all_categories << category
      end
    end
    all_categories.uniq!
    @categories = all_categories

    # We know the current user
    # Get their cookbook
    # For each recipe in their cookbook, check all the categories that recipe has
    # make a list of all the categories for all the recipes in the cookbook
    # show the user all the unique categories from that list
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
