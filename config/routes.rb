Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root to: 'homes#index'

  get 'performers/identification'
  get 'performers/full_body'
  get 'opinions/terms'
  get 'opinions/policy'
  get 'opinions/transaction'
  get 'opinions/service'
  get 'homes/job_offer'
  get 'homes/play_content'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :homes, only: [:index, :show]
  resources :tests, only: [:index, :show]
  resources :performers, only: [:new, :show, :edit, :update]
  resources :opinions, only: [:index]
  
end
