Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :guilds do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
end
