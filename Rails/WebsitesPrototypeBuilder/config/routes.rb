WebsitesPrototypeBuilder::Application.routes.draw do

	# set devise for Designer, and set the registerations controller to the custom one
	devise_for :designers, :controllers => { :registrations => "registrations" }

get "projects/:project_id/tasks/:task_id/steps/:step_id/reviewers/:reviewer_id" =>'tasks#task_reviewer'
post 'steps/update'

	resources :projects do
		resources :statistics
		resources :tasks do
			resources :steps
			resources :task_results
		end
	end


	resources :tasks do
		resources :steps
	end

 post 'cardsorts/:cardsort_id/reviewer_create_group' => 'cardsorts#reviewer_create_group'
 post 'cardsorts/submit/:cardsort_id/reviewer/:reviewer_id' => 'cardsorts#submit'
 get 'cardsorts/review/:cardsort_id/reviewer/:reviewer_id' => 'cardsorts#review'
 post 'cardsorts/:cardsort_id/delete_card/:card_id' => 'cardsorts#delete_card'
 post 'cardsorts/:cardsort_id/delete_group/:group_id' => 'cardsorts#delete_group'
 get 'cardsorts/show/:cardsort_id' => 'cardsorts#show'
 get 'cardsorts/new'
 post 'cardsorts/:cardsort_id/create_card' => 'cardsorts#create_card'
 post 'cardsorts/:cardsort_id/create_group' => 'cardsorts#create_group'

	#at start up page goes to the home controller and the index action

	root to: "home#index"

	resources :projects

	get "comments/create"
	get "comments/destroy"
	get "questions/create"
	get "questions/destroy"
	get "answers/create"
	get "answers/destroy"
	get "pages/reviewer"
	get "pages/designer"
	get "questionnaires/answer_show"
	get "questionnaires/index"

	get "answer_questionnaires/create"

	 resources :questionnaires do
		resources :qquestions do
			resources :choice_qquestions
			resources :answer_questionnaires
		end 
	end

	get "pages/designer"
	get "projects/index"
	post "projects/upload_media"

	resources :projects

	resources :pages do
		resources :comments
		resources :questions do
			resources :answers
		end
	end
 
	get "/log/:id" => 'task_results#index'

	get "/tasks/edit_steps/:id" => "tasks#edit_steps", :as => :edit_steps
	get "/tasks/new_step/" => "tasks#new_step",:as => :new_step
	get "/tasks/delete_step/" => "tasks#delete_step", :as => :delete_step
	get "tasks/invite/:id" => "tasks#invite"
	
	resources :tasks do
		resources :task_results
	end
	
	get "/taketask/:task_id/:reviewer_id" => 'tasks#makesure'
	match "/task" => 'task#fill_task' #Try to change this, not regular way of having routes + will match any incorrect url in the task path

	post "tasks/invite_user/:id" => "tasks#invite_user"

	get "/log/:id" => 'task_results#index'
	get 'projects/design/:project_id' => 'projects#design'
	

	# The priority is based upon order of creation:
	# first created -> highest priority.

	# Sample of regular route:
	#   match 'products/:id' => 'catalog#view'
	# Keep in mind you can assign values other than :controller and :action

	# Sample of named route:
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

	root :to => 'tasks#index'

	# See how all your routes lay out with "rake routes"

	# This is a legacy wild controller route that's not recommended for RESTful applications.
	# Note: This route will make all actions in every controller accessible via GET requests.
	# match ':controller(/:action(/:id))(.:format)'
end
