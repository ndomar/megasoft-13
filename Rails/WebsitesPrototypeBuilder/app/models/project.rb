class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :project_type

  has_many :tasks, :dependent => :destroy
  #set the project to have many pages
  has_many :pages

end