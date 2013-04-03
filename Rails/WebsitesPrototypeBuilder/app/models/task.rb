  #* *Attributes*    :
  #   -+name+ -> name of the task (string)
  #   -+description+ -> description of task (text)
  #* *Relations*    :
  #   -belongs to the Project model
class Task < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project

  validates :name, :presence => true

end
