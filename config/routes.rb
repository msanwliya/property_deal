Rails.application.routes.draw do
 
  devise_for :users, path: 'users'
  resources  :properties do
    collection do
      put :approve
     end
  end
  resources  :requirements
  resources  :property_types
  resources  :addresses
  resources  :searches
  resources  :users
  root 'properties#index'
  get '/home', to: 'properties#home'
  # get '/approve', to: "properties#approve", as: 'approve_properties'
  
end
