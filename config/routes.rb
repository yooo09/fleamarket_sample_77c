Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  post 'items/:id/edit' => 'items#edit'
  post 'items/:id/confirm' => 'items#confirm'
  get '/likes' => 'likes#index'
  post '/likes/:item_id' => 'likes#create'
  delete '/likes/:item_id/:user_id' => 'likes#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :destroy] do
    resources :credit_cards, only: [:new, :create, :edit, :update]
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
    end
    collection do
      get :search
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :categories, only: [:index, :show]
end
