Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :guilds do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
    resources :milestones
    resources :guildmemberships, only: [:create]
    resources :users, only: [:index]
    member do
      get "manage"
    end
  end
  resources :milestones, only: [] do
      resources :tasks
    end
end
