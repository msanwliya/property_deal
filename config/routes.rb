Rails.application.routes.draw do
 
  devise_for :users, path: 'users'
  resources  :properties
  resources  :requirements
  resources  :property_types
  resources  :addresses
  resources  :searches
  root 'properties#index'
  get '/home', to: 'properties#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
