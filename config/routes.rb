# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  scope path: 'api', format: :json, export: true do
    devise_for :auth, class_name: 'Auth::Models::Auth', only: []

    namespace :auth do
      as :auth do
        resource :session, controller: 'controllers/sessions', only: %i[create destroy show], path: ''
        resource :register, controller: 'controllers/registrations', only: %i[create] do
          get :check
        end
      end
    end

    namespace :emails do
      post :verify, to: 'verify/controllers/verifications#create'
    end

    resources :users, only: :update, controller: 'users/controllers/users'

    get '*path', to: 'application#not_found', export: false

  end

  get '*path', to: 'application#show'
  root 'application#show'
end
