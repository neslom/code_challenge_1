Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show, :create]
  resources :users,  only: [:index, :show]

  post "items/:id/favorite", to: "items#favorite"
  get "items/:id/unfavorite", to: "items#unfavorite"

  get "/favorites", to: "favorites#index"
end
