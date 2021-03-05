Rails.application.routes.draw do
  resources :locations do
    resources :jobs, shallow: true
  end

  root 'application#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
