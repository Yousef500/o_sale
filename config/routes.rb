Rails.application.routes.draw do
  get "users/new", to: "users#new", as: "new_user"
  get "/signup", to: "users#new"
  resources :users
  root "products#index"

  resources :products

  # get "products", to: "products#index", as: "products"
  # get "products/new", to: "products#new", as: "new_product"
  # get "products/:id", to: "products#show", as: "product"
  # get "products/:id/edit", to: "products#edit", as: "edit_product"
  # patch "products/:id", to: "products#update"
  # post "products", to: "products#create"
  # delete "products/:id", to: "products#destroy"
end
