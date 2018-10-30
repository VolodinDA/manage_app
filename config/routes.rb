Rails.application.routes.draw do
  get 'languages/create'
  get 'languages/destroy'
  get 'abilities/create'
  get 'abilities/destroy'
  get 'characteristics/create'
  get 'characteristics/destroy'
  get 'merits/create'
  get 'merits/destroy'
  get 'rewards/create'
  get 'rewards/destroy'
  get 'objectives/create'
  get 'objectives/destroy'
  get 'departments/create'
  get 'departments/destroy'
  get 'workers/create'
  get 'workers/destroy'
  get 'assignments/create'
  get 'assignments/destroy'
  get 'errands/create'
  get 'errands/destroy'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'static_pages#home'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to:  'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
