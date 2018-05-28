Rails.application.routes.draw do
	
  root to: 'home#index'
  get "/items/:id", to: 'home#show', as: "item_show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
