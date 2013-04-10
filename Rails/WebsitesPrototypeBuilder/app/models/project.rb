class Project < ActiveRecord::Base
  ##
  # Attributes:
  # This is the project model 
  # * *Attributes*    :
  #   - +Project_name+-> This is the name of the project
  #   - +type+-> This is the type of the project
  # * *Relations  :
  #   -A project belongs to one designer
  #   -A project has many tasks 
  #   -A project has many pages
  attr_accessible :description, :project_name, :project_type, :designer_id

  belongs_to :designer
  has_many :tasks, :dependent => :destroy
  has_many :pages, :dependent => :destroy
end
