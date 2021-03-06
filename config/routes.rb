Rails.application.routes.draw do
  get 'charts/index'

  devise_for :admins
  resources :all_notices
  root 'homes#index'
  
  #플러스 친구 라우팅
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  
  get '/losts/destroy/:id' => 'losts#destroy'
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
  
  # 댓글
  resources :comments, only: [:create, :destroy]

  resources :fleamarkets
  
  get 'secret/index' => 'secret#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'comments' => 'comments#create'
  
  delete 'comments/:id' => 'comments#destroy'
  
  namespace :charts do
    get "new_users"
  end
  
  devise_for :users, :skip => :registration
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end