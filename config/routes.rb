Rails.application.routes.draw do
  devise_for :users
  root to: "places#index"
  get 'places/:id', to: 'places#show', as: 'place'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
