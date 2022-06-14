# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :v1 do
    resources :disbursements, only: :index, defaults: { format: 'json' }
  end
end
