Rails.application.routes.draw do
  devise_for :users
  namespace :owner do
    resources :places
    resources :bookings, only: %i[index show]
  end
  resources :places, only: %i[index show] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show destroy]
  resources :bookmarks, only: %i[create destroy]
  root to: "places#index"
end
