Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard', as: :dashboard

  resources :flats do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:show, :edit, :update, :destroy] do
    member do
      patch :accept
      patch :decline
    end
  end

  resources :offers, only: [:index]
end
