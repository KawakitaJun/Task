Rails.application.routes.draw do
  resources :departments, only: [:index, :create, :show, :destroy, :edit, :update]
  resources :account_managements, only: [:index, :create, :destroy, :update]  
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registration => 'users/registrations'
  }
  root to: 'top_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end