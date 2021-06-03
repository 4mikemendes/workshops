Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :workshops do
    resources :student_workshops, only: [:create]
    resources :reviews, only: :create
  end
  resources :student_workshops, only: [:update]
  resources :reviews, only: :destroy
end
