Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'pages#home'
  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
             controllers: {omniauth_callbacks: 'omniauth_callbacks',registrations: 'registrations' }

  get 'agents' => 'users#agents'

  resources :users, only: [:show, :index] do
    member do
      get 'profile_picture' => 'users#profile_picture'
      get 'company_logo' => 'users#company_logo'
      get 'phone_verification' => 'users#phone_verification'
      get 'social_connect' => 'users#social_connect'
      post '/verify_phone_number' => 'users#verify_phone_number'
      patch '/update_phone_number' => 'users#update_phone_number'

    end
    resources :contacts, only: [:create]
    resources :pictures, only: [:create, :destroy]
    resources :logos, only: [:create, :destroy]

  end
  resources :reviews, only: [:create, :destroy]

  get 'blogs/add_new_post' => 'blogs#new', as: "blogs/add_new_post"
  resources :blogs


  resources :listings, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'features'
      get 'location'
      get 'listing_status'

    end
    resources :photos, only: [:create, :destroy]
    resources :availabilities, only: [:create]
    resources :tell_a_friends, only: [:create]
    resources :comments, only: [:create]
  end

  resources :chats, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get 'about' => 'pages#about'
  get 'privacy' => 'pages#privacy'
  get 'terms-of-service' => 'pages#terms'
  get 'search' => 'pages#search'
  get 'search_list', to: 'pages#search_list'
  get 'rent' => 'pages#rent'
  get 'short_stay' => 'pages#short_stay'
  get 'sales' => 'pages#sales'
  get 'for_rent' => 'pages#for_rent'
  get 'for_short_stay' => 'pages#for_short_stay'
  get 'dashboard' => 'dashboards#index'
  get '/notification_settings' => 'settings#edit'
  post '/notification_settings' => 'settings#update'
  get '/notifications' => 'notifications#index'

  resources :supports, only: [:new, :create]
  get '/support' => 'supports#new'


  mount ActionCable.server => '/cable'

end
