Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard'


  resources :flats do
    resources :bookings, only: [:create, :show]
  end

  resources :offers, only: [:index]
end
