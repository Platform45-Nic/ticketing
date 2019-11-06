Rails.application.routes.draw do
  root to: 'static_pages#index'
  
  devise_for :users, controllers: {registrations: "users/registrations"}

  namespace :admins do
    get 'show', to: 'show', as: 'profile'
  end
  scope '/admins' do
    resources :catagories, only: [:index, :show, :new, :create]
    resources :events
  end

  scope '/user' do
    get 'show', to: 'normals#show', as: 'normals_profile'
    resources :accounts, only: [:show]
    put 'account/topup', to: 'accounts#update', as: 'top_up_account'
    resources :events, only: [:show, :edit, :update]
    resources :marketplace, controller: 'marketplaces', only: [:index, :show]
    scope '/options' do
      get 'show/tickets', to: 'tickets#index', as: 'user_tickets'
      put 'ticket', to: 'marketplaces#update', as: 'ticket_to_marketplace'
    end
    scope '/event' do
      get 'index', to: 'events#index', as: 'normals_events'
      get 'show/:id', to: 'events#show', as: 'normals_event'
      resources :show, controller: 'tickets', only: [:edit, :update]
      get 'show/:id/tickets', to: 'tickets#show', as: 'show_tickets'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
