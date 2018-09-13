Rails.application.routes.draw do
  
  #플러스 친구 라우팅
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  
  resources :foods
  resources :huntings
  resources :losts
  root 'home#index'
  
  get '/huntings/edit_conf' => 'huntings#edit_conf'
  
  resources :fleamarkets
  resources :pubs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
