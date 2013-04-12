# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130409143914) do

  create_table "answers", :force => true do |t|
    t.string   "answer"
    t.integer  "question_id"
    t.integer  "page_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cards", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "cardsort_id"
    t.integer  "group_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cardsorts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.boolean  "open"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "choice_qquestions", :force => true do |t|
    t.text     "body"
    t.integer  "number"
    t.integer  "questionnaire_id"
    t.integer  "project_id"
    t.integer  "qquestion_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "choice_qquestions", ["project_id"], :name => "index_choice_qquestions_on_project_id"
  add_index "choice_qquestions", ["qquestion_id"], :name => "index_choice_qquestions_on_qquestion_id"
  add_index "choice_qquestions", ["questionnaire_id"], :name => "index_choice_qquestions_on_questionnaire_id"

  create_table "choices", :force => true do |t|
    t.string   "body"
    t.integer  "qquestion_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "choices", ["qquestion_id"], :name => "index_choices_on_qquestion_id"

  create_table "comments", :force => true do |t|
    t.integer  "page_id"
    t.integer  "reviewer"
    t.text     "assigned_part"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "designers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "fullname"
    t.string   "phone_number"
    t.string   "country"
    t.integer  "day_dob"
    t.integer  "month_dob"
    t.integer  "year_dob"
    t.integer  "credit_card_number"
    t.integer  "cvv2"
    t.string   "profession"
    t.string   "facebook_email"
    t.string   "gender"
    t.string   "rpx_identifier"
  end

  add_index "designers", ["email"], :name => "index_designers_on_email", :unique => true
  add_index "designers", ["reset_password_token"], :name => "index_designers_on_reset_password_token", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "cardsort_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "page_name"
    t.text     "html"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
  end

  create_table "pictures", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.string   "project_type"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "designer_id"
  end

  create_table "qquestions", :force => true do |t|
    t.text     "body"
    t.integer  "qtype"
    t.integer  "questionnaire_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "qquestions", ["questionnaire_id"], :name => "index_qquestions_on_questionnaire_id"

  create_table "questionnaires", :force => true do |t|
    t.string   "title"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "questionnaires", ["project_id"], :name => "index_questionnaires_on_project_id"

  create_table "questions", :force => true do |t|
    t.integer  "page_id"
    t.text     "assigned_part"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reviewer_infos", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.boolean  "gender"
    t.string   "country"
    t.integer  "day_of_birth"
    t.integer  "month_of_birth"
    t.integer  "year_of_birth"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "reviewer_id"
  end

  create_table "reviewers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviewers_tasks", :id => false, :force => true do |t|
    t.integer "reviewer_id"
    t.integer "task_id"
  end

  create_table "step_answers", :force => true do |t|
    t.boolean  "successful"
    t.time     "time_from_start"
    t.integer  "reviewer_id"
    t.integer  "task_result_id"
    t.integer  "step_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "step_answers", ["reviewer_id"], :name => "index_step_answers_on_reviewer_id"
  add_index "step_answers", ["step_id"], :name => "index_step_answers_on_step_id"
  add_index "step_answers", ["task_result_id"], :name => "index_step_answers_on_task_result_id"

  create_table "steps", :force => true do |t|
    t.string   "component"
    t.string   "event"
    t.text     "description"
    t.integer  "task_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "steps", ["task_id"], :name => "index_steps_on_task_id"

  create_table "task_results", :force => true do |t|
    t.integer  "task_id"
    t.integer  "reviewer_id"
    t.integer  "clicks"
    t.boolean  "success"
    t.integer  "time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "page_id",     :default => 1
  end

end
=======
# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130409143914) do

  create_table "answer_questionnaires", :force => true do |t|
    t.text     "body"
    t.integer  "questionnaire_id"
    t.integer  "qquestion_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "answer_questionnaires", ["qquestion_id"], :name => "index_answer_questionnaires_on_qquestion_id"
  add_index "answer_questionnaires", ["questionnaire_id"], :name => "index_answer_questionnaires_on_questionnaire_id"

  create_table "answers", :force => true do |t|
    t.string   "answer"
    t.integer  "question_id"
    t.integer  "page_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cards", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "cardsort_id"
    t.integer  "group_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cardsorts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.boolean  "open"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "choice_qquestions", :force => true do |t|
    t.text     "body"
    t.integer  "number"
    t.integer  "questionnaire_id"
    t.integer  "project_id"
    t.integer  "qquestion_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "choice_qquestions", ["project_id"], :name => "index_choice_qquestions_on_project_id"
  add_index "choice_qquestions", ["qquestion_id"], :name => "index_choice_qquestions_on_qquestion_id"
  add_index "choice_qquestions", ["questionnaire_id"], :name => "index_choice_qquestions_on_questionnaire_id"

  create_table "choices", :force => true do |t|
    t.string   "body"
    t.integer  "qquestion_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "choices", ["qquestion_id"], :name => "index_choices_on_qquestion_id"

  create_table "comments", :force => true do |t|
    t.integer  "page_id"
    t.integer  "reviewer"
    t.text     "assigned_part"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "designers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "fullname"
    t.string   "phone_number"
    t.string   "country"
    t.integer  "day_dob"
    t.integer  "month_dob"
    t.integer  "year_dob"
    t.integer  "credit_card_number"
    t.integer  "cvv2"
    t.string   "profession"
    t.string   "facebook_email"
    t.string   "gender"
    t.string   "rpx_identifier"
  end

  add_index "designers", ["email"], :name => "index_designers_on_email", :unique => true
  add_index "designers", ["reset_password_token"], :name => "index_designers_on_reset_password_token", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "cardsort_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "page_name"
    t.text     "html"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
  end

  create_table "pictures", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.string   "project_type"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "designer_id"
  end

  create_table "qquestions", :force => true do |t|
    t.text     "body"
    t.integer  "qtype"
    t.integer  "questionnaire_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "qquestions", ["questionnaire_id"], :name => "index_qquestions_on_questionnaire_id"

  create_table "questionnaires", :force => true do |t|
    t.string   "title"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "questionnaires", ["project_id"], :name => "index_questionnaires_on_project_id"

  create_table "questions", :force => true do |t|
    t.integer  "page_id"
    t.text     "assigned_part"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reviewer_infos", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.boolean  "gender"
    t.string   "country"
    t.integer  "day_of_birth"
    t.integer  "month_of_birth"
    t.integer  "year_of_birth"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "reviewer_id"
  end

  create_table "reviewers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviewers_tasks", :id => false, :force => true do |t|
    t.integer "reviewer_id"
    t.integer "task_id"
  end

  create_table "step_answers", :force => true do |t|
    t.boolean  "successful"
    t.time     "time_from_start"
    t.integer  "reviewer_id"
    t.integer  "task_result_id"
    t.integer  "step_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "step_answers", ["reviewer_id"], :name => "index_step_answers_on_reviewer_id"
  add_index "step_answers", ["step_id"], :name => "index_step_answers_on_step_id"
  add_index "step_answers", ["task_result_id"], :name => "index_step_answers_on_task_result_id"

  create_table "steps", :force => true do |t|
    t.string   "component"
    t.string   "event"
    t.text     "description"
    t.integer  "task_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "steps", ["task_id"], :name => "index_steps_on_task_id"

  create_table "task_results", :force => true do |t|
    t.integer  "task_id"
    t.integer  "reviewer_id"
    t.integer  "clicks"
    t.boolean  "success"
    t.integer  "time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "page_id",     :default => 1
  end

end
>>>>>>> 676ac6bb285d7a19a9c6c2642fe1edf4956d993c
