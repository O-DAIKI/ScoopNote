# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "musics#index"
  resources :musics do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :favorite]
end
