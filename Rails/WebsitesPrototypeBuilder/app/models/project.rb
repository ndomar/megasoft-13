class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :project_type

  #Association
  has_many :pages
end
