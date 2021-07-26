Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', controllers: {
    registrations:  'api/v1/auth/registrations'
  }


  root to: 'home#landing'
  get 'home/statistics', to: 'home#statistics'
  get 'home', to: 'home#index'
  # rest api
  mount API::Base, at: "/"

  # documentation
  mount GrapeSwaggerRails::Engine, at: "/documentation"
end
