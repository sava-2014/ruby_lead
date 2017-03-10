Rails.application.routes.draw do

  root  'static_pages#home'

  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :products, only: [:create, :destroy, :edit]
  resources :targets

  resources :users,   shallow: true do
    resources :products
  end

  resources :products,   shallow: true do
    resources :targets
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
