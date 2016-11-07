Rails.application.routes.draw do
  get 'pets', to: 'pets#index', as: 'pets'
  # or 
  # resources :pets
  # ?query= builds a new key:value pair

  get '/pets/search', to: 'pets#search', as: 'pets_search' # might werk

  get '/pets/:id', to: 'pets#show', as: 'pet' #show_pet is more ruby

  

end
