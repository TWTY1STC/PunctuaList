Rails.application.routes.draw do

  root 'users#show' 
 
  devise_for :users 
  
  resources :users, only: [:show] do
    resources :items, only: [:new, :create, :destroy]
  end
  
  get 'welcome/home'
end