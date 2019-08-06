Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :recipes do #, only: [:index, :show]
    resources :photos, only: :create
    
  end
  resources :categories #, only: [:new, :create, :show] 
  resources :cookbooks, only: [:index, :create, :show]
    post 'cookbook/:recipe', to: 'cookbooks#add_recipe', as: :add_recipe_to_cookbook
end
