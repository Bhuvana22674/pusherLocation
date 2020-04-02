Rails.application.routes.draw do
  get 'checkins/create'
  get 'trips/index'
  get 'trips/create'
  get 'trips/show'

  resources :trips do
    resources :checkins, only: :create
  end
  root 'trips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
