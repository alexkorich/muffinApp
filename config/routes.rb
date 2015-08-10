Rails.application.routes.draw do

  namespace :admin do
    get '/' => 'dashboard#index'


    get 'orders/find_by_date/:date' => 'orders#find_by_date'
    get 'orders/find_by_user/:id' => 'orders#find_by_user'
    
    get 'orders/:date' => 'orders#show'
    # get 'orders/show_by_date/:date' => 'orders#show'
    resources :dishes
    resources :orders 
    resources :users

  end

  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  devise_for :users
  get 'menus/find_by_date' => 'menus#find_by_date'
  resources :orders
  resources :menus
 

  root "menus#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
