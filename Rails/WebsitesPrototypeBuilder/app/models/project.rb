  #* *Attributes*    :
  #   -+project_name+ -> name of the project (string)
  #   -+description+ -> description of project (text)
  #   -+type+ -> type of the project (string)
  #* *Relations*    :
  #   -has many tasks
class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :project_type

  has_many :tasks, :dependent => :destroy
end
