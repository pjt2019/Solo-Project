class Cookbook < ApplicationRecord
  has_many :cookbook_recipes
  has_many :recipes, through: :cookbook_recipes
end
