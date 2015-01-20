Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help' => 'static_pages#help', :as => "help"
  get 'signup'  => 'users#new', :as => "signup"

  resources :users
end
