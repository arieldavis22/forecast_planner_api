Rails.application.routes.draw do
  resources :users
  resources :events, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  post '/signup', to: "users#create"
  post '/login', to: "auth#login"
  get '/autologin', to: "auth#autologin"
  post '/logout', to: "auth#logout"
  post '/addfriend', to: "users#addfriend"
  post '/seefriends', to: "users#seefriends"



  post '/getevents', to: "users#getevents"
end
