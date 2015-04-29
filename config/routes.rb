Rails.application.routes.draw do
  root 'home#index'

  resources :managers
  resources :subscribers, only: %i[index new create manage update] do
  resources :managers, except: %i[show]
  resources :subscribers, except: %i[show edit destroy] do
    get :manage, on: :collection
  end
end
