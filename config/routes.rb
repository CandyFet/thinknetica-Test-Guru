# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, only: %i[edit show new create destroy], shallow: true do
      resources :answers, only: %i[edit show new create destroy], shallow: true
    end

    post :start, on: :member

  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
