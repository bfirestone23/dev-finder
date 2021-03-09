Rails.application.routes.draw do

  resources :jobs, only: [:new, :create, :index] do
    resources :applications
  end

  resources :locations, only: [:index] do
    resources :jobs
  end

  root 'application#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }
  get '/users/:id', to: 'users/users#show', as: 'user'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
