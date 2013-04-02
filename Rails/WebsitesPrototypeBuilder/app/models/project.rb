class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :type

  #Associations
  has_many :pages
  belongs_to :designer
end
