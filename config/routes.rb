Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :recipes do #, only: [:index, :show]
    resources :photos, only: :create
  end
  resources :categories #, only: [:new, :create, :show]
  resources :cookbooks
end
