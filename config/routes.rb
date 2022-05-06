# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dashboard_developers
  resources :dashboard_qas
  resources :dashboard_managers
  devise_for :users
  resources :projects do
    resources :bugs
  end
  resources :projects do
    member do
      get 'edit_users_list'
    end
  end
  post "projects/:id/bugs/new", to: "bugs#create"
  devise_scope :user do
    authenticated :user do
      root 'projects#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
