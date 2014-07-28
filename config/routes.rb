require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "posts#index"
    resource :session, only: [:destroy]
    resource :posts, only: [:new, :create, :index]
  end

  constraints Monban::Constraints::SignedOut.new do
    root "users#new", as: :sign_in
    resource :session, only: [:new, :create]
    resources :users, only: [:new, :create]
  end
end
