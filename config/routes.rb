# -*- encoding : utf-8 -*-
Jcai::Application.routes.draw do

	namespace :teacher do
		resources :courses do
			# spetial actions of :courses
			member do
				get "students"
			end
			# sub resources
			resources :notifies, :messages
			# coursewares
			resources :coursewares do
				member do 
					get "download"
				end
			end
			# exams as sub resources of course
			resources :exams do
				resources :records
				# questions as sub resources of exam
				resources :questions do
					member do
						get "question"
						get "choices"
						post "move_up"
						post "move_down"
					end
				end  # end of questions
			end    # end of exams
		end      # end of courses
	end

	namespace :student do
		resources :courses do
			member do
				get "arrangement"
			end
			# sub resources of courses
			resources :notifies, :messages
			# coursewares
			resources :coursewares do
				member do
					get "download"
				end
			end
			# exams
			resources :exams do
				member do
					get "start"
					post "check"
				end
				resources :questions do
					member do
						get "question"
						get "choices"
					end
				end
			end
		end
	end

	namespace :admin do
	  resources :teachers, :students, :notices
		resources :courses do
			member do
				get "students", :action => "students"
				post "students", :action => "add_students"
				delete "students", :action => "remove_students"
			end
		end
	end

  root :to => 'login#welcome'

  get "login/welcome"

  get "login/login"
	
  post "login/login"

  get "login/logout"

  get "login/notice"

  get "login/change_password"

  post "login/change_password"

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
