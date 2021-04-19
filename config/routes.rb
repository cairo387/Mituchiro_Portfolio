Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
