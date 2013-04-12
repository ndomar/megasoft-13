  ##
  # each instance of this model represents a task that belongs to one project
  #* *Attributes*    :
  #   -+name+ -> name of the task (string)
  #   -+description+ -> description of task (text)
  #* *Relations*    :
  #   -belongs to one project 
  #   -belongs to one page 
  #   -has many task results 
  #   -has a many to many relationship with reviewers
class Task<ActiveRecord::Base
  attr_accessible :description, :name, :page_id

  belongs_to :project
  belongs_to :page
  has_many :task_results
  has_and_belongs_to_many :reviewers
  validates :name, :presence => true
end
