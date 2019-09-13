# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, only: %i[edit show new create destroy], shallow: true
  end
end
