Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # root to: 'user#switch'
  root to: "Welcome#index"
  resources :companies do
    member do
      get :home
    end
    member do
      get :all_events
    end
    scope module:'company' do
      resources :jobs, controller: 'job_opportunities' do
        patch :select_candidates
        member do
          post 'select_candidates/mail' => :send_mail_to_all_shortlisted_candidates
          post 'select_candidate/:candidate_id/mail' => :send_mail_to_shortlisted_candidate, as: 'send_mail_to_candidate'
        end
        resources :events, controller: 'events'
      end
    end
  end

  resources :admins

  resources :candidates do
    member do
      get 'home'
      get 'resume'
      get 'jobs'
      scope 'jobs' do
        post ':job_id/apply' => :apply_job, as:'apply_job'
      end
    end
    scope module:'candidate' do
      resources :achievements, except:[:edit,:show,:new] do
        collection do
          get 'edit'
        end
      end
      resources :projects, except:[:edit,:show,:new] do
        collection do
          get 'edit'
        end
      end
      resources :course_scores
      resources :experiences, except:[:edit,:show,:new] do
        collection do
          get 'edit'
        end
      end
      resources  :links, except:[:edit,:show,:new] do
        collection do
          get 'edit'
        end
      end
      resources :references, except:[:edit,:show,:new] do
        collection do
          get 'edit'
        end
      end
    end
  end


  scope '/candidates/:candidate_id/' do
    resources :qualifications, as:'candidate_qualification', except:[:edit,:show,:new] do
      collection do
        get 'edit'
      end
    end
    resources :skills, as:'candidate_skill', except:[:edit,:show,:new,:update,:create,:destroy] do
      collection do
        get 'edit',as: 'edit'
        put 'update',as: 'update'
      end
    end
    resource :location , as:'candidate_location'
  end

  scope '/companies/:company_id/' do
    resource :location, as:'company_location'
    resources :reviews, as:'company_reviews', only:[:index,:show]
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
