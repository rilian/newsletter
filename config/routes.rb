Rails.application.routes.draw do
  root 'home#index'

  resources :issues
  resources :managers, except: %i[show]
  resources :subscribers, except: %i[show edit destroy] do
    get :manage, on: :collection
  end
end
