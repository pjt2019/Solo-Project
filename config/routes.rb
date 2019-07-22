Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :recipes, only: [:index, :show]
  namespace :author do
    resources :recipes, only: [:new, :create, :show]
  end
end
