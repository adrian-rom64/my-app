Rails.application.routes.draw do
  resources :images
  devise_for :users
  root 'pages#home'

  get 'payments/new'
  get 'payments/continue'
  get 'payments/success'
  get 'payments/cancel'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
