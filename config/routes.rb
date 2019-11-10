Rails.application.routes.draw do
  resources :images
  devise_for :users
  root 'pages#home'

  get 'payments/new', as: :new_payment
  get 'payments/continue'
  get 'payments/success'
  get 'payments/cancel'
  get 'payments', to: 'payments#index', as: :payments
  get 'payments/:id', to: 'payments#pay', as: :payment

  get 'chatroom', to: 'chatroom#index', as: :chatroom
  post 'messages', to: 'messages#create', as: :new_message

  mount ActionCable.server, at: '/cable'
end
