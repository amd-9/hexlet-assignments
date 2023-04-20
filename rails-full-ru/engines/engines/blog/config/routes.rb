# frozen_string_literal: true

Blog::Engine.routes.draw do
  root to: 'posts#index'

  resources :posts
end
