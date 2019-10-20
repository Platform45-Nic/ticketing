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
    resources :events, only: [:show, :edit, :update]
    scope '/event' do
      get 'index', to: 'events#index', as: 'normals_events'
      get 'show/:id', to: 'events#show', as: 'normals_event'
      # Below routes are specific to purchasing tickets for a event:
      # get 'show/:id/edit', to: 'tickets#edit', as: 'event_ticket_purchase'
      resources :show, controller: 'tickets', only: [:edit, :update]
      # patch 'show/:id', to: 'tickets#update', as: 'ticket_purchased_patch'
      # put 'show/:id', to: 'tickets#update', as: 'ticket_purchased_put'
      get 'show/:id/tickets', to: 'tickets#show', as: 'show_tickets'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
