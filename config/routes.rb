# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboard_qas/index'
  get 'dashboard_qas/show'
  get 'dashboard_qas/edit'
  get 'dashboard_qas/new'
  get 'dashboard_qas/create'
  get 'dashboard_developers/index'
  get 'dashboard_developers/show'
  get 'dashboard_developers/edit'
  get 'dashboard_developers/new'
  get 'dashboard_developers/create'
  get 'dashboard_managers/index'
  get 'dashboard_managers/show'
  get 'dashboard_managers/edit'
  get 'dashboard_managers/new'
  get 'dashboard_managers/create'
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
