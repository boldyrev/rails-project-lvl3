# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'bulletins#index'

    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth

    resources :sessions, only: :destroy

    resources :bulletins, only: %i[index new create show]

    namespace :admin do
      root 'bulletins#index'
      resources :categories, except: :show
      resources :bulletins, only: :index
      resources :users, only: :index
    end
  end
end
