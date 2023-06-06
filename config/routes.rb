Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users
  resources :bookings

  resources :cameras, except: :index do
    # Define additional camera routes if needed
  end

  # Allow access to /cameras index route without authentication
  get '/cameras', to: 'cameras#index', constraints: { authenticated: false }
  post '/bookings', to: 'bookings#create', as: 'create_booking'
end
