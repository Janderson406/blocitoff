Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
    resources :items, only: [:create]
  end

  get 'about' => 'welcome#about'
  get 'items/create'
  get 'users/show' #still cannot get route to function without this?

  root 'welcome#index'
end
