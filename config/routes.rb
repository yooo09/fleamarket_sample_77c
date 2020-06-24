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
    end
  end  
end
