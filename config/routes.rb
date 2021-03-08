Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :guilds do
    resources :posts, only: [:create, :edit, :update, :destroy]
    resources :guildmemberships, only: [:create, :index, :update, :destroy] do
      member do
        patch "status"
      end
    end
    resources :milestones
    resources :users, only: [:index]
    member do
      get "manage"
    end
  end
  resources :milestones, only: [] do
      resources :tasks
    end
end
