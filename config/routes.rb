Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"

  resources :messages, :only => [:index, :create]

  # websockets
  mount ActionCable.server => '/cable'
end
