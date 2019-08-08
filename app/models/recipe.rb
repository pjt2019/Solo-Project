class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_categories, dependent: :destroy
  has_many :user_recipes, dependent: :destroy
  has_many :categories
  has_many :categories, through: :recipe_categories
  has_many :cookbooks
  has_many :cookbooks, through: :cookbook_recipes
  mount_uploader :photo, PhotoUploader, dependent: :destroy
end
