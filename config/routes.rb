Rails.application.routes.draw do
  root "home#index", as: :home

  get "register", to: "register#new"
end
