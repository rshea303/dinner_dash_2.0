Rails.application.routes.draw do
  get '/menu', to: "static_pages#menu"
  get '/dashboard', to: "static_pages#dashboard"

  root "static_pages#home"

  resources :users do
    resources :orders
  end

  resources :categories

  resource :session
  resources :cart_items
end
