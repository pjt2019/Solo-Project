class RecipeCategory < ApplicationRecord
  belongs_to :recipe, dependent: :destroy
  belongs_to :category
end
