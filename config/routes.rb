EvenMoreRottenMangoes::Application.routes.draw do

  # get "adminusers/index"
  # get "sessions/new"
  # get "sessions/create"
  # get "users/new"
  # get "users/create"
  # resources :movies
  # root to: 'movies#index'

  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
  end

  resource :password, only: [:edit, :update]

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'movies#index'

  # sessions_controller - login/logout friends/friends_controller/logged_in_friends
  #new this is our log in form (get)
  #create this is the actual log in happening (post)
  #destroy log out (delete)

  #a RESTFUL controller uses 7 actions that correspond to the 7 actions that come along with resources:


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
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
