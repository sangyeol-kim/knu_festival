Rails.application.routes.draw do
  
  get 'secret/index'

  devise_for :users
  #플러스 친구 라우팅
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  
  resources :foods
  resources :huntings
  resources :losts
  root 'home#index'
  
  resources :fleamarkets
  resources :pubs
  
  get 'secret/index' => 'secret#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
