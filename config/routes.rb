Rails.application.routes.draw do
  root to: 'items#index'
  resources :lotteries

  get 'get_lotteries', to: 'lotteries#get_data', :as => 'get_lottery'

  resources :items
  resources :items_imports, only: [:new, :create]
  resources :archives, only: [:index, :new, :create, :destroy]


  devise_for :users

  get 'results'                     => 'results#index',   :as => 'results'
  get 'results/:patient_id'         => 'results#show',    :as => 'results_show'
  get 'results/:patient_id/export'  => 'results#export',  :as => 'results_export'

  resources :forms, only: [ :new, :create, :index, :show] do
    resources :questions, only: [:index, :show] do
      resources :answers
    end
  end
end
