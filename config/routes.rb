Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :reviews, only: [:new, :create]
    end
end
