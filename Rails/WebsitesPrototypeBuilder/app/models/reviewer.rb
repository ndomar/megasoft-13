  ##
  # each instance of this model represents one reviewer
  #* *Attributes*    :
  #   -+email+ -> email of the reviewer (string)
  #* *Relations*    :
  #   -has many task results 
  #   -has a many to many relationship with tasks
class Reviewer < ActiveRecord::Base
  
  has_many :task_results
  has_and_belongs_to_many :tasks
  has_one :reviewer_info
  has_many :step_answers
  attr_accessible :email
end