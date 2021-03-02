Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  resources :guilds, only: :show do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
=======
  resources :guilds
>>>>>>> master
end
