Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'

  resources :articles, only: [:create, :show, :update] do
    resources :comments, only: [:create, :show, :destroy]
  end

  resources :users do
    resources :articles, except: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
