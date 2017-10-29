Rails.application.routes.draw do
  devise_for :users
  root to: "dashboard#front"
  
  get "home", to: "dashboard#home"
  post 'start_game', to: "dashboard#start_game"
end
