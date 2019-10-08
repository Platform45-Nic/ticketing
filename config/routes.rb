Rails.application.routes.draw do
  root to: 'static_pages#index'
  devise_for :users

  namespace :admins do
    get 'show', to: 'show', as: 'profile'
  end
  namespace :normals do
    get 'show', to: 'show', as: 'profile'
  end

  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  #   get 'signup', to: 'devise/registrations#new'
  # end

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
