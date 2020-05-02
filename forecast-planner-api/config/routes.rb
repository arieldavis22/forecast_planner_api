Rails.application.routes.draw do
  post '/signup', to: "users#create"
  post '/login', to: "users#login"
  get '/autologin', to: "users#autologin"
  get '/logout', to: "users#logout"
end
