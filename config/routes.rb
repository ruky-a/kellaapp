Rails.application.routes.draw do
  get 'dashboard', to: 'users#dashboard'
  post 'users/edit', to: 'users#update'
  get 'users/:id', to: 'users#show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

 root 'homepage#index'

 devise_for :user,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'profile', sign_out: 'logout'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
