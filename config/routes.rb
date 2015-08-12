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
    resources :first_course_dishes
     resources :second_course_dishes
     resources :drinks
    resources :dishes
    resources :orders 
    resources :users
    resources :menus
  root "menus#index"

end
