Rails.application.routes.draw do
  root to: 'static_pages#index'
  devise_for :users

  namespace :admins do
    get 'show', to: 'show', as: 'profile'
  end
  scope '/admins' do
    resources :catagories, only: [:index, :show, :new, :create]
    resources :events
  end

  scope '/user' do
    get 'show', to: 'normals#show', as: 'normals_profile'
    resources :accounts, only: [:index, :show]
    scope '/event' do
      get 'index', to: 'events#index', as: 'normals_events'
      get 'show/:id', to: 'events#show', as: 'normals_event'
    end
  end

  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  #   get 'signup', to: 'devise/registrations#new'
  # end

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
