Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  resources :articles, only: [:index, :show]
  resources :chiropractors, only: [:index] do
    resource :favorites, only: [:create, :destroy]
    resource :reviews, only: [:create, :destroy]
    resource :events, only: [:new]
  end
  resources :reservations, only: [:new, :create]
  post '/reservations/confirm' => 'reservations#confirm'
  get '/reservations/completed' => 'reservations#completed'

  devise_for :chiropractors, controllers: {
  sessions: 'chiropractors/sessions',
  passwords: 'chiropractors/passwords',
  registrations: 'chiropractors/registrations'
  }

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

  namespace :admin do
    resources :articles, only: [:new, :create, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :treatments, only: [:index, :create, :edit, :update, :destroy]
  end

  namespace :chiropractor do
    resources :chiropractors, only: [:show, :edit, :update]
    resources :reservation, only: [:index]
  end

  namespace :user do
    resources :users, only: [:show, :edit, :update]
    resources :reservation, only: [:index]
  end
end
