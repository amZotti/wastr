require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "posts#index"
    resource :session, only: [:destroy]
    resources :categories, only: [:new, :create, :show, :edit, :update, :destroy]

    resources :posts, only: [:new, :create, :index, :show] do
      resources :comments, only: [:create]
      resource :upvote, only: [:create]
      resource :downvote, only: [:create]
    end

    resources :comments, only: [] do
      resources :replies, only: [:create]
    end
  end

  constraints Monban::Constraints::SignedOut.new do
    root "users#new", as: :sign_up
    resource :session, only: [:new, :create]
    resources :users, only: [:new, :create]
  end
end
