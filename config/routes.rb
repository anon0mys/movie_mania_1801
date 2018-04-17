Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :directors, shallow: true do
    resources :movies
  end

  resources :movies, only: [:index]
  resources :actors

  resources :genres, only: [:index, :show]
  post '/genres', to: 'admin/genres#create'

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/cart', to: 'cart#create'
end
