Rails.application.routes.draw do
  
  resources :foods
  resources :huntings
  resources :losts
  root 'home#index'
  
  resources :fleamarkets
  resources :pubs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
