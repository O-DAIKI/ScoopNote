# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  root to: "musics#index"
  resources :musics do
    resource :favorites, only: [:create, :destroy]
    collection do
      get "search"
    end
  end

  resources :users, only: [:show, :edit, :update, :favorite] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    collection do
      get 'search'
    end
  end

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end
end
