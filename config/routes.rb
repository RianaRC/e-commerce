Rails.application.routes.draw do
	
  get 'order/create'
  root to: 'home#index'
  get "/items/:id", to: 'home#show', as: "item_show"
  get "/cart", to: 'home#cart', as: "cart_show"
  devise_for :users
  get 'carts/:id/create', to: 'cart#create', as: "cart_create"
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
