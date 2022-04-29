# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dashboard_developers
  resources :dashboard_qas
  resources :dashboard_managers
  devise_for :users
  resources :bugs
  resources :projects do
    member do
      get 'edit2'
    end
  end

  devise_scope :user do
    authenticated :user do
      root 'projects#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
