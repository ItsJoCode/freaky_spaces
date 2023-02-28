Rails.application.routes.draw do
  devise_for :users
  namespace :owner do
    resources :places
    resources :bookings, only: %i[index show]
  end
  resources :places, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show destroy]
  root to: "places#index"
end
