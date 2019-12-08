Rails.application.routes.draw do
  resources :departments, only: [:index, :create, :show, :destroy, :edit, :update]
  devise_for :users
  root to: 'top_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end