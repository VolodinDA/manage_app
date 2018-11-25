Rails.application.routes.draw do
  root 'static_pages#home'
  match '/signup', to: 'users#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/assign', to:'departments#update', via: 'put'
  match '/toerrand', to:'users#to_errand', via: 'patch'
  resources :users
  resources :sessions, only: [:create, :destroy]
  resources :languages, only: [:create, :destroy]
  resources :speeches, only: [:create, :destroy]
  resources :abilities, only: [:create, :destroy]
  resources :characteristics, only: [:create, :destroy]
  resources :merits, only: [:create, :destroy]
  resources :rewards, only: [:create, :destroy]
  resources :objectives, only: [:create, :destroy]
  resources :departments
  resources :assignments, only: [:create, :destroy]
  resources :errands
  get :department_form, controller: :static_pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
