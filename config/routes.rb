Rails.application.routes.draw do

  resources :jobs, only: [:new, :create, :index] do
    resources :applications, except: [:destroy, :edit]
  end

  resources :locations, only: [:index] do
    resources :jobs
  end

  root 'application#home'

  devise_scope :user do 
    get '/confirm', to: 'users/omniauth_callbacks#landing', as: 'landing'
    post '/confirm/:params', to: 'users/omniauth_callbacks#facebook'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }
  get '/users/:id', to: 'users/users#show', as: 'user'
  get '/users', to: 'users/users#index', as: 'users'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
