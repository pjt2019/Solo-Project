class Category < ApplicationRecord
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
  has_many :user_categories
  has_many :users, through: :user_categories
  mount_uploader :photo, PhotoUploader
end
