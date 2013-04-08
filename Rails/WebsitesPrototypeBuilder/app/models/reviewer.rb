class Reviewer < ActiveRecord::Base
  
  has_many :task_results
  has_many :step_answers
  attr_accessible :email
end
