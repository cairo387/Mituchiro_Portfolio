Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :articles, only: [:index, :show]
   resources :chiropractors, only: [:index] do
    resource :favorites, only: [:create, :destroy]
    resource :reviews, only: [:create, :destroy]
  end

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

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

  namespace :admin do
    resources :articles, only: [:new, :create, :edit, :update, :destroy]
  end
  namespace :user do
    resources :users, only: [:show, :edit, :update]
  end
end
