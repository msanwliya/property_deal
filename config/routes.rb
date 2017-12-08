Rails.application.routes.draw do
 
  devise_for :users, path: 'users'
  resources  :properties
  resources  :requirements
  resources  :property_types
  resources  :addresses
  resources  :searches
  resources  :users
  root 'properties#index'
  get '/home', to: 'properties#home'
end
