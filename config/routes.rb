Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :destroy] do
    resources :credit_cards, only: [:new, :create, :show, :edit, :update, :destroy] do
      collection do
        get 'buy'
        post 'pay'
      end
    end
  end

  resources :items do

    member do
      get 'confirm'
    end

    collection do
      get :search
    end
  end 

    member do
      get 'purchase'
    end
  end
end
