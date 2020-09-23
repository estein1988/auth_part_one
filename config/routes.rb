Rails.application.routes.draw do
  resources :users
  post '/login', to: 'users#login' 
  get '/profile', to: 'users#profile'
end