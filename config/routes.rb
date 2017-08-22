Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    member do
      post :add_to_cart
    end
  end
  namespace :admin do
    resources :products
  end
  resources :carts do
    collection do
      delete :clear
      post :checkout
    end
  end
  resources :cart_items
  resources :orders
end
