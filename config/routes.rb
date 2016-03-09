Rails.application.routes.draw do

  resources :tasks
  resources :users
  resources :relations do
    member do
      get :complete, :verify
    end
  end
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'signup' => 'users#new'
  get 'logout' => 'sessions#destroy'
  root 'welcome#home'  
  
end
