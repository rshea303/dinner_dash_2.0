Rails.application.routes.draw do
  get '/menu', to: "static_pages#menu"
  root "static_pages#home"

  resources :users
  resource :session
end
