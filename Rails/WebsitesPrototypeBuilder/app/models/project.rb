  ##
  # each instance of this model represents a project that belongs to one designer
  #* *Attributes*    :
  #   -+project_name+ -> name of the project (string)
  #   -+project_description+ -> description of project (text)
  #   -+type+ -> type of the project (string)
  #* *Relations*    :
  #   -belongs to one designer 
  #   -has many tasks 
  #   -has many pages 
class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :project_type

  belongs_to :designer
  has_many :tasks, :dependent => :destroy
  has_many :pages, :dependent => :destroy
end