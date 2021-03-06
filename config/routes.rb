Rails.application.routes.draw do

  resources :notifications, only: :index do
    member do
      get :read_all, defaults: { :format => :js }
    end
  end

  resources :friendships

  resources :ratings

  resources :trades do
    post :accept
    post :cancel
    post :cancel_proposal
    post :close_proposal
    post :accept_proposal
    post :received
    resources :message_trades
    resources :bottle_trades do
      member do
        post :add
        post :remove
      end
    end
  end

  resources :profiles

  resources :questions do
    member do
      post :vote, defaults: { :format => :js }
    end
    resources :answers do
      member do
        post :vote, defaults: { :format => :js }
        post :vote_best_answer
      end
    end
  end

  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  resources :users do
    resources :bottles do
      get :index, :path => 'cellar'
    end
    resources :favorite_questions do
      member do
        post :set_favorite, defaults: { :format => :js }
        post :remove_favorite, defaults: { :format => :js }
      end
    end
  end

  resources :dashboards, only: :index
  resources :searchs, only: :index
  resources :logins, only: :index
  resources :registers, only: :index
  resources :homepages, only: :index

  devise_scope :user do
    #root to: "devise/sessions#new"
  end

  resources :conversations do
    resources :messages
  end

  get '/adresses/search_postal_code/:postal_code' => 'adresses#search_postal_code'
  get '/adresses/get_cities_by_symbol/:symbol' => 'adresses#get_cities_by_symbol'

  root to: 'homepages#index'


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
