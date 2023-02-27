Rails.application.routes.draw do
  namespace :owner do
    resources :places
  end
  devise_for :users
  resources :places, only: %i[index show new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "places#index"
end
