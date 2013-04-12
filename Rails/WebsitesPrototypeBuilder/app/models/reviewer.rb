class Reviewer < ActiveRecord::Base
  
  has_many :task_results
  has_and_belongs_to_many :tasks
  has_one :reviewer_info
  has_many :step_answers
  attr_accessible :email
end