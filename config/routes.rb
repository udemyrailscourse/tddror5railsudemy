Rails.application.routes.draw do
  devise_for :users
  root to: "dashboard#front"
  
  get "home", to: "dashboard#home"
end
