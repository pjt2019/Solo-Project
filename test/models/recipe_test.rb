require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "Set categories" do
    r = Recipe.find_by_title('Fish')
    c = Category.find_by_title('Smelly')
    r.categories = [c]
    assert r.categories.count == 1
  end

  test "Add category" do
    r = Recipe.find_by_title('Pancakes')
    c = Category.find_by_title('Breakfast')
    num_categories = r.categories.count
    r.categories << c
    assert r.categories.count == (num_categories + 1)
  end
end
