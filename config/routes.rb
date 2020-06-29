Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :destroy] do
    resources :credit_cards, only: [:new, :create, :edit, :update]
    member do
      get :logout
    end
  end

  resources :items do
    member do
      get 'confirm'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :categories, only: [:index, :show]

end
