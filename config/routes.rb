Rails.application.routes.draw do


  root 'home#index'
  
  devise_for :users
  #플러스 친구 라우팅
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  
  resources :foods
  resources :huntings
  resources :losts
  
  get '/huntings/edit_conf/:id' => 'huntings#edit_conf'
  get '/huntings/destroy/:id' => 'huntings#destroy'
  
  resources :fleamarkets
  resources :pubs
 
  
  get 'secret/index' => 'secret#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/comments' => 'comments#create'
  
  delete '/comments/:id' => 'comments#destroy'

end
