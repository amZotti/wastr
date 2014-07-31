require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    resource :session, only: [:destroy]
    resources :categories, only: [:new, :create, :show, :edit, :update, :destroy]

    resources :posts, only: [:new, :create] do
      resources :comments, only: [:create]
      resource :upvote, only: [:create]
      resource :downvote, only: [:create]
      resources :comments, only: [:create, :show]
    end

    resources :comments, only: [] do
      resources :comments, only: [:create]
    end
  end

  constraints Monban::Constraints::SignedOut.new do
    resource :session, only: [:new, :create]
    resources :users, only: [:new, :create]
  end

  resources :posts, only: [:index, :show]
  root "posts#index"
end
