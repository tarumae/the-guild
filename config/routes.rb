Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :guilds do
    resources :posts 
  end

end
