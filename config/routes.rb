Rails.application.routes.draw do
  root 'static_pages#home'

  get    'help' => 'static_pages#help', :as => "help"
  get    'signup'  => 'users#new', :as => "signup"

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :tasks, only: [:create, :destroy]
end
