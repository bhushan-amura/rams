Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root to: 'user#switch'

  get '/secret', to: 'user#secret', as: :secret

  resources :companies do
    member do
        get :home
    end
    resources :jobs, to: 'company/job_opportunities' do
      resources :events, to: 'company/events'
    end
  end
  
  resources :admins

  resources :candidates do
    scope module:'candidate' do
      resources :achievements
      resources :projects
      resources :course_scores
      resources :references
      resources :experiences
      resources  :links
      resources :references
    end
  end


  scope '/candidates/:candidate_id/' do
    resources :qualifications, as:'candidate_qualification'
    resources :skills, as:'candidate_skill'
    resource :location , as:'candidate_location'
  end

  scope '/companies/:company_id/' do
    resource :location, as:'company_location'
    scope 'jobs/:job_id' do
      resources :qualifications, as:'job_qualification'
      resources :skills, as:'job_skill'
      scope '/events/:event_id' do
        resource :location, as: 'event_location'
      end
    end
  end


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
