Rails.application.routes.draw do
  devise_for :users

  root 'articles#index'
  resources :articles, only: [:index, :show]

  namespace :admin do
    resources :articles, only: [:index, :new, :create, :destroy, :edit, :update]
  end

end
