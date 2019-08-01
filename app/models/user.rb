class User < ApplicationRecord
  has_many :recipes
  has_many :user_categories
  has_many :user_recipes
  has_many :categories
  has_many :categories, through: :user_categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
