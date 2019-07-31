class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_categories
  has_many :user_recipes
  has_many :categories, through: :recipe_categories
  mount_uploader :photo, PhotoUploader
end
