require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Add recipe to category" do
    breakfast = Category.find_by_title('Breakfast')
    fish_recipe = Recipe.find_by_title('Fish')
    breakfast.recipes << fish_recipe
    assert breakfast.recipes.include?(fish_recipe)
  end
end
