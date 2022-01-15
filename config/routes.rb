Rails.application.routes.draw do
  get 'masters/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root to: 'homes#index'
  get 'performers/identification'
  get 'performers/full_body'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :homes, only: [:index]
  resources :tests, only: [:index,:show]
  resources :performers, only: [:new, :show, :edit, :update]
  
end
