Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root to: 'homes#index'

  get 'performers/identification'
  get 'performers/full_body'
  get 'homes/terms'
  get 'homes/policy'
  get 'homes/transaction'
  get 'homes/service'
  get 'homes/job_offer'
  get 'homes/play_content'
  get 'homes/fee'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests, only: [:index, :show]
  resources :performers, only: [:index, :new, :show, :edit, :update]
  resources :opinions, only: [:index, :new, :create]
  resources :homes, only: [:index, :new, :create, :update]
end
