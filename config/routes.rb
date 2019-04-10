Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'registration', to: 'sessions#create_user'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'


end
