Rails.application.routes.draw do
  
  #플러스 친구 라우팅
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  
  resources :foods
  resources :huntings
  resources :losts
  root 'home#index'
  
  resources :fleamarkets
  resources :pubs
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/comments' => 'comments#create'
  
  delete '/comments/:id' => 'comments#destroy'

end
