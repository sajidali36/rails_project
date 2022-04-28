# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :bugs
  resources :projects

  devise_scope :user do
    authenticated :user do
      root 'projects#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
