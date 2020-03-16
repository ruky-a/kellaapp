Rails.application.routes.draw do

  # get 'dashboard', to: 'users#dashboard'
  post 'users/edit', to: 'users#update'
  # get 'users/:id', to: 'users#show'
  # get 'members', to: 'users#members'


 devise_for :users


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  post '/free' => 'charge#free'
    get '/search', to: 'homepage#search'
    get '/applications', to: 'jobapplications#applications'
   get '/job_applications', to: 'jobapplications#job_applications'
   get '/plans', to: 'homepage#plans'
  get '/settings/payment', to:'users#payment', as: 'settings_payment'
     get '/videos', to: 'homepage#videos'
  


 root 'homepage#index'

  get 'solutions', to: 'homepage#solutions'

 resources :jobs do
  resources :jobapplications, only: [:create]
  collection do
  get 'search'
end
end

resource :dashboard, only: [:show]
 resources :users, only: [:show, :update, :index]
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
    
