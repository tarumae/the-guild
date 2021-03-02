Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
<<<<<<< HEAD
  resources :guilds, only: :show do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
=======
  resources :guilds
>>>>>>> master
=======

  resources :guilds do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
>>>>>>> master
end
