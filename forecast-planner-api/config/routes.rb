Rails.application.routes.draw do
  resources :events 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signup', to: "users#create"
  post '/login', to: "users#login"
end
