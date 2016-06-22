Rails.application.routes.draw do

  get 'welcome/index'
  get 'sessions/login_attempt'
  get 'sessions/login'
  get 'sessions/home'
  # get 'sessions/profile'
  get 'sessions/setting'
  get 'sessions/signup'
  get 'welcome/index'
  get 'users/new'
  get 'friendships/new'
  get 'restaurants/new'
  get 'reservation/new'
  get 'foodndrink/new'

  resources :users
  resources :restaurants
  resources :friendships
  resources :reservations
  resources :foodndrinks
  
  resources :users do
    member do
      get :confirm_email
    end
  end

  root 'welcome#index'
  
  post ':controller(/:action(/:id(.:format)))'
  get ':controller(/:action(/:id(.:format)))'
  match '/about', to: 'home#about', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/addrestaurants', to: 'restaurants#new', via: 'get'
  match '/addreservation', to: 'reservation#new', via: 'get'
  match '/addfoodndrink', to: 'foodndrink#new', via: 'get'
  match '/login', to: 'sessions#login', via: 'get'
  match '/logout', to: 'sessions#logout', via: 'get'
  match '/main', to: 'sessions#main', via: 'get'
  match '/profile', to: 'sessions#profile', via: 'get'
  match '/setting', to: 'sessions#setting', via: 'get'
  match '/home', to: 'sessions#home', via: 'get'

  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end