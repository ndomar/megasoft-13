WebsitesPrototypeBuilder::Application.routes.draw do

  get "tests/test_image"

  # set devise for Designer, and set the registerations controller to the custom one
  devise_for :designers, :controllers => { :registrations => "registrations" }

  post "/projects/destroy"
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
    resources :task_results
  end

  resources :tasks do
    resources :steps
  end

 post 'cardsorts/invite_reviewer'
 get 'cardsorts/invitations/:cardsort_id' => 'cardsorts#invitations'
 post 'cardsorts/:cardsort_id/reviewer_create_group' => 'cardsorts#reviewer_create_group'
 post 'cardsorts/submit/:cardsort_id/reviewer/:reviewer_id' => 'cardsorts#submit'
 get 'cardsorts/review/:cardsort_id/reviewer/:reviewer_id' => 'cardsorts#review'
 post 'cardsorts/:cardsort_id/delete_card/:card_id' => 'cardsorts#delete_card'
 post 'cardsorts/:cardsort_id/delete_group/:group_id' => 'cardsorts#delete_group'
 post 'cardsorts/:cardsort_id/create_card' => 'cardsorts#create_card'
 post 'cardsorts/:cardsort_id/create_group' => 'cardsorts#create_group'
 post 'cardsorts/create_cardsort'
 get 'cardsorts/show/:cardsort_id' => 'cardsorts#show'
 get 'cardsorts/new'
  get 'cardsorts/edit'
 get 'cardsorts/create_card'
 get 'cardsorts/create_group'
 get 'cardsorts/reviewer_invitation/:cardsort_id' => "cardsorts#reviewer_invitation"
 
  #at start up page goes to the home controller and the index action

  root to: "projects#index"

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
  
  get "/taketask/:task_id/:reviewer_id" => 'tasks#makesure'
  match "/task" => 'task#fill_task' #Try to change this, not regular way of having routes + will match any incorrect url in the task path

  post "tasks/invite_user/:id" => "tasks#invite_user"

  get "/log/:id" => 'task_results#index'
  get 'projects/design/:project_id' => 'projects#design'
end
