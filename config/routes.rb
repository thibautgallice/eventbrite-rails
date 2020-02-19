Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
  get 'team', to: 'static#team'


  resources :users, only: [:show, :index]
  resources :events, only: [:index, :new, :show, :create]
end
