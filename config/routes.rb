Rails.application.routes.draw do
  root 'home#index'

  resources :subscribers, only: %i[index new create manage update] do
    get :manage, on: :collection
  end
end
