Rails.application.routes.draw do


  get 'comments/create'
 devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'profile'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'users#dashboard'
  
  post '/free' => 'charge#free'
    get '/search', to: 'homepage#search'
    get '/applications', to: 'jobapplications#applications'
   get '/job_applications', to: 'jobapplications#job_applications'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

 root 'homepage#index'
 resources :jobs, only: [:index, :new,:show, :create] do
  resources :jobapplications, only: [:create]
end

 resources :users, only: [:index, :show, :edit]
 resources :courses, only: [:index, :show] do
  resources :enrollments, only: :create
   resources :comments, only: [:create]

    resources :reviews, only: [:create, :destroy]
 end
 resources :lessons, only: [:show]
 namespace :instructor do
   resources :lessons, only: [:update]
    resources :sections, only: [:update] do
    resources :lessons, only: [:create]
  end
  resources :courses, only: [:new, :create, :show] do
    resources :sections, only: [:create]
     end

 
end
end
    
