Rails.application.routes.draw do
  root to: 'top_pages#index'
  resources :top_pages, only: [:index] do
    collection do
      get 'app_description'
    end
  end
  resources :departments, only: [:index, :create, :show, :destroy, :edit, :update]
  resources :account_managements, only: [:index, :create, :destroy, :update]
  
  resources :categories, only: [:index, :create]
  delete '/categories/', to: 'categories#destroy'
  delete '/clients/', to: 'categories#clientdestroy'
  post '/clients/', to: 'categories#clientcreate'
  
  resources :tasks, only: [:index, :create, :destroy, :update]
  resources :taskdetails, only: [:index, :create, :edit, :update]
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registration => 'users/registrations'
  }
  devise_scope :user do
    get 'users' => 'devise/registrations#new', as: :new_user_registration_reload
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end