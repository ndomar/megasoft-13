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

ActiveRecord::Schema.define(:version => 20130331075140) do

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

  create_table "designers", :force => true do |t|
    t.string   "designer_name"
    t.string   "email"
    t.integer  "facebook_id"
    t.integer  "credit_card_number"
    t.string   "phone_number"
    t.string   "country"
    t.string   "profession"
    t.string   "max_size"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "cardsort_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "invitations", :force => true do |t|
    t.text     "invitation_text"
    t.text     "invitation_link"
    t.datetime "expiry_date"
    t.integer  "status"
    t.integer  "reviewer_id"
    t.integer  "task_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.string   "type"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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
  end

  create_table "reviewers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
