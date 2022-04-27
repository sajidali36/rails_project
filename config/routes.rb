# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bugs
  root 'projects#index'
  resources :projects
  devise_for :users
end
