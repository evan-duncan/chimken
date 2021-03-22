Rails.application.routes.draw do
  devise_for :users
  resources :flocks
  get 'myflocks', controller: :flocks
  root 'welcome#index'
end
