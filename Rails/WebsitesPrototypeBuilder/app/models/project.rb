class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :project_type

  has_many :tasks, :dependent => :destroy
  has_many :pages, :dependent => :destroy
end
