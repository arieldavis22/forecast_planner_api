Rails.application.routes.draw do
  post '/signup', to: "users#create"
  post '/login', to: "users#login"
end
