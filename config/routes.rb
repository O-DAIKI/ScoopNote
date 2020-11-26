# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'musics#index'
  resources :musics, only: %i[index new create show]
end
