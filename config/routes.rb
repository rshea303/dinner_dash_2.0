Rails.application.routes.draw do
  get '/menu', to: "static_pages#menu"
  root "static_pages#home"

  resources :users do
    resources :orders
  end

  resource :session
  resources :cart_items
end
