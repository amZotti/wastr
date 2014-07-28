require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "posts#index"
    resource :session, only: [:destroy]
    resources :posts, only: [:new, :create] do
      resources :comments, only: [:create]
    end
  end

  constraints Monban::Constraints::SignedOut.new do
    root "users#new", as: :sign_up
    resource :session, only: [:new, :create]
    resources :users, only: [:new, :create]
  end

  resources :posts, only: [:index, :show]
end
