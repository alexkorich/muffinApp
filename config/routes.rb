Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  devise_for :users

  namespace :admin do
    get '/' => 'dashboard#index'
    get 'orders/find_by_date/:date' => 'orders#find_by_date'
    get 'orders/find_by_user/:user_id' => 'orders#find_by_user'
    get 'orders/:date' => 'orders#show'
    # get 'orders/show_by_date/:date' => 'orders#show'
    resources :dishes
    resources :orders 
    resources :users
    resources :menus
  end
 
  get 'menus/find_by_date' => 'menus#find_by_date'
  resources :orders, only: [:create, :create_from_menu, :read, :show]
  resources :menus, only: [:create, :read, :find_by_date]

  root "menus#index"

end
