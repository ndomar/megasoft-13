WebsitesPrototypeBuilder::Application.routes.draw do
  post 'projects/savePage'
  get 'projects/createPage'
  get 'projects/deletePage'
  get 'projects/showPage'
  get 'projects/design'
  get "tests/test_image"
  # set devise for Designer, and set the registerations controller to the custom one
  devise_for :designers, :controllers => { :registrations => "registrations" }

  get "taketask/:project_id/:task_id/:reviewer_id" =>'tasks#task_reviewer'
  get "taketask/:project_id/:task_id" => 'tasks#task_reviewer'
  post 'steps/update'

  match 'pages/sendReview' => 'pages#sendReview', :as => :sendReview_page
  match 'questionnaire/sendQuestionnaire' => 'questionnaires#sendQuestionnaire', :as => :sendQuestionnaire_questionnaire

  post "/projects/destroy"

  get "tasks/task_reviewer_done" => "tasks#task_reviewer_done"

  resources :projects do
    resources :statistics
    resources :tasks do
      resources :steps
      resources :task_results
    end
  end

resources :logs
post 'logs/new'
#at start up page goes to the home controller and the index action
  root to: "projects#index"

# set devise for Designer, and set the registerations controller to the custom one
devise_for :designers, :controllers => { :registrations => "registrations" }

get 'projects/design/:project_id' => 'projects#design'
get 'projects/:project_id/design/:project_id' => 'projects#design'
  post "/projects/destroy"
post 'steps/update'

  resources :tasks do
    resources :task_results
  end

  resources :tasks do
    resources :steps
  end

get "/edit_tasks/new_step/" => "tasks#new_step",:as => :new_step
get "/edit_tasks/delete_step/" => "tasks#delete_step", :as => :delete_step
get "tasks/invite/:id" => "tasks#invite"
post "tasks/invite_user/:id" => "tasks#invite_user"
  get "answer_questionnaires/create"
  post "tasks/invite_user/:id" => "tasks#invite_user"
  get "tasks/invite/:id" => "tasks#invite"
  get "/taketask/:task_id/:reviewer_id" => 'tasks#makesure'
  match "/task" => 'task#fill_task' #Try to change this, not regular way of having routes + will match any incorrect url in the task path


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

resources :projects do
  resources :tasks do
    resources :steps
    resources :task_results
  end
end

  get "comments/create"
  get "comments/destroy"
  get "questions/create"
  get "questions/destroy"
  get "answers/create"
  get "answers/destroy"
  get "pages/reviewer"
  get "pages/designer"
  get "pages/download"
  get "pages/download_project"
  get "questionnaires/answer_show"
  get "questionnaires/finish"
  get "questionnaires/index"
  get "pages/flowchart"

  get "answer_questionnaires/create"

  get "pages/designer"
  get "projects/index"
  post "projects/upload_media"


post 'reviewers/:reviewer_id/reviewer_infos/new' => "reviewer_infos#new"
resources :reviewers do
resources :reviewer_infos
end


  resources :tasks do
    resources :steps
  end

 
  #at start up page goes to the home controller and the index action


  get "answer_questionnaires/create"

  resources :questionnaires do
    resources :qquestions do
      resources :choice_qquestions
      resources :answer_questionnaires
    end
  end


resources :pages do
resources :comments
resources :questions do
resources :answers
end
end

  resources :projects do
    resources :statistics
    resources :tasks do
    end
  end


get "projects/:project_id/tasks/:task_id/steps/:step_id/reviewers/:reviewer_id" =>'tasks#task_reviewer'
get "projects/:project_id/tasks/:id/edit_steps/" => "tasks#edit_steps", :as => :edit_steps
  get "projects/:project_id/tasks/:id/save_start_page/:page_id" => "tasks#save_start_page", :as => :save_start_page
  get "projects/:project_id/tasks/:id/select_start_page/" => "tasks#select_start_page", :as => :select_start_page
  get '/projects/:project_id/tasks/:task_id/result/:result_id' => 'tasks#log'
  post "tasks/invite_user" => "tasks#invite_user"
end
