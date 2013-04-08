  #* *Attributes*    :
  #   -+name+ -> name of the task (string)
  #   -+description+ -> description of task (text)
  #* *Relations*    :
  #   -belongs to the Project model
class Task<ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project
  
  belongs_to :page

  has_many :task_results
  has_and_belongs_to_many :reviewers

  validates :name, :presence => true
end
