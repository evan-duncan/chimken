Rails.application.routes.draw do
  devise_for :users
  resources :flocks do
    resources :chickens
    resources :invitations, only: %i[new create]
  end
  get 'myflocks', controller: :flocks
  root 'welcome#index'
end
