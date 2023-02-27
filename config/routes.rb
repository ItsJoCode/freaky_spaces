Rails.application.routes.draw do
  namespace :owner do
    resources :places
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "places#index"
  get 'places/:id', to: 'places#show', as: 'place'
end
