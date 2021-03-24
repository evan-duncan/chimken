Rails.application.routes.draw do
  devise_for :users
  resources :flocks do
    resources :chickens
    resources :invitations, only: %i[new create]
  end
  get 'myflocks', controller: :flocks

  mount Thredded::Engine => '/forums'

  root 'welcome#index'
end
