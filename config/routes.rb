Rails.application.routes.draw do

  root  'static_pages#home'

  get    '/help',         to: 'static_pages#help'
  get    '/about',        to: 'static_pages#about'
  get    '/contact',      to: 'static_pages#contact'

  get    '/target_users', to: 'target_users#show'

  get    '/signup',       to: 'users#new'
  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'

  resources :users
  resources :target_users


  resources :sessions, only: [:new, :create, :destroy]
  resources :products, only: [:create, :destroy, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



 # comfy_route :cms_admin, :path => '/admin'

  # Make sure this routeset is defined last
 # comfy_route :cms, :path => '/', :sitemap => false

end
