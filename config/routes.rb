Rails.application.routes.draw do

  resources :reviews
  resources :comments
  root 'pages#home'
  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
             controllers: {omniauth_callbacks: 'omniauth_callbacks',registrations: 'registrations' }

  resources :users, only: [:show] do
    member do
      post '/verify_phone_number' => 'users#verify_phone_number'
      patch '/update_phone_number' => 'users#update_phone_number'
    end
  end
  resources :listings, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'features'
      get 'location'
    end
    resources :photos, only: [:create, :destroy]
    resources :availabilities, only: [:create]
  end

  resources :chats, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  get 'search' => 'pages#search'
  get 'for-rent' => 'pages#search_for_rent'
  get 'dashboard' => 'dashboards#index'
  get '/notification_settings' => 'settings#edit'
  post '/notification_settings' => 'settings#update'
  get '/notifications' => 'notifications#index'

  resources :supports, only: [:new, :create]
  get '/support' => 'supports#new'
  

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
