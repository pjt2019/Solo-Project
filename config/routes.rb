Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :recipes #, only: [:index, :show]
  resources :categories #, only: [:new, :create, :show]
end
