Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  namespace :author do
    resources :recipes, only: [:new, :create, :show]
  end
end
