Rails.application.routes.draw do
  devise_for :users
  resources :flocks do
    resources :chickens
  end
  get 'myflocks', controller: :flocks
  root 'welcome#index'
end
