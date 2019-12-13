# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
