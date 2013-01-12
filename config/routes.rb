Minitunes::Application.routes.draw do
  get "profiles/show"

  as :user do
    get '/register', to: 'devise/registrations#new', as: :register
    get '/login', to: 'devise/sessions#new', as: :login
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  devise_for :users, skip: [:sessions]

  as :user do
    get "/login" => 'devise/sessions#new', as: :new_user_session
    post "/login" => 'devise/sessions#create', as: :user_session
    delete "/logout" => 'devise/sessions#destroy', as: :destroy_user_session
  end

  post 'friendships/create', to: 'friendships#create', as: :friendships
  delete 'friendships/destroy', to: 'friendships#destroy', as: :friendship_destroy

  post 'user_artist/create', to: 'user_artist#create', as: :user_artist
  delete 'user_artist/destroy', to: 'user_artist#destroy', as: :destroy_user_artist

  get ':id', to: 'profiles#show', as: 'profile'
  get ':id/followings', to: 'profiles#followings', as: :followings
  get ':id/followers', to: 'profiles#followers', as: :followers

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

  get 'artists/:name', to: 'artists#show', as: :artist
  post 'artists/:name/reviews/create', to: 'reviews#create', as: :reviews
  post 'artists/search', to: 'artists#create', as: :new_artist
  get 'artists/search/:search', to: 'artists#search_artist', as: :search_artist
  get 'artists/:name/albums/:title', to: 'albums#show', as: :album
  get 'artists/:name/albums/:title/create', to: 'albums#create', as: :artist_album
  get 'artists/:name/albums/:title/:song', to: 'songs#show', as: :song

  # map '/' to be a redirect to '/movies'
  root :to => 'index#index'

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
