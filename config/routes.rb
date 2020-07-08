Rails.application.routes.draw do
  devise_for :users

  #SNSAPI使用
  # devise_for :users, controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks',
  #   registrations: 'users/registrations'
  # }
  
  root 'items#index'
  post 'items/:id/edit' => 'items#edit'
  post 'items/:id/confirm' => 'items#confirm'
  get '/likes' => 'likes#index'
  post '/likes/:item_id' => 'likes#create'
  delete '/likes/:item_id/:user_id' => 'likes#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:new, :show, :destroy] do
    resources :credit_cards, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :adresses, only: [:new, :create, :edit, :update,:destroy]
    member do
      get :logout
    end
  end

  
  resources :items do
    resources :comments, only: [:create, :destroy]  
    member do
      get 'confirm'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'purchase'
      post 'pay'
    end
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
      get 'deep_search'
    end
  end
  
  resources :categories, only: [:index, :show]
   
end
