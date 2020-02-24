Rails.application.routes.draw do


 devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'profile'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'users#dashboard'
  post 'users/edit', to: 'users#update'
  get 'users/:id', to: 'users#show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

 root 'homepage#index'
 resources :courses, only: [:index, :show]
 namespace :instructor do 
  resources :courses, only: [:new, :create, :show] do
    resources :sections, only: [:new, :create]
  end
end


end
