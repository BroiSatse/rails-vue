# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  scope path: 'api', format: :json, export: true do
    devise_for :auth, class_name: 'Auth::Models::Auth', only: []

    namespace :auth do
      as :auth do
        resource :session, controller: 'controllers/sessions', only: %i[create destroy show], path: ''
      end
    end

    get '*path', to: 'application#not_found', export: false
  end

  get '*path', to: 'application#show'
  root 'application#show'
end
