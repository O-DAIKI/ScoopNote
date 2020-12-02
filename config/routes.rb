# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "musics#index"
  resources :musics do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :favorite] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end
