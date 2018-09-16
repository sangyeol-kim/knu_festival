Rails.application.routes.draw do
  root 'homes#index'
  
  devise_for :users
  #플러스 친구 라우팅
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  
  resources :foods do
    collection do
      get :index2
      get :index3
      get :index4
    end
  end
  resources :huntings
  resources :losts
  
  get '/huntings/edit_conf/:id' => 'huntings#edit_conf'
  get '/huntings/destroy/:id' => 'huntings#destroy'
  
  resources :fleamarkets do
    collection do
      get :index2
      get :index3
    end
  end

  resources :fleamarkets
 
  
  get 'secret/index' => 'secret#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'comments' => 'comments#create'
  
  delete 'comments/:id' => 'comments#destroy'

end