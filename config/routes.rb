Rails.application.routes.draw do
<<<<<<< Updated upstream
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
  devise_for :users
  root to: 'pages#index'
  resources :pages
>>>>>>> Stashed changes
end
