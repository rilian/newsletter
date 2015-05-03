Rails.application.routes.draw do
  devise_for :managers
  default_url_options host: ENV['DOMAIN']

  root 'home#index'

  resources :issues
  resources :links, except: %i[show]
  resources :managers, except: %i[show]
  resources :subscribers, except: %i[show edit destroy] do
    get :manage, on: :collection
  end
end
