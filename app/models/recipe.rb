class Recipe < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :recipe_categories
  has_many :recipe_categories
end
