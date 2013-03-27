class Project < ActiveRecord::Base
  belongs_to :designer #The project belongs to one designer

  attr_accessible :name, :project_type, :description

  validates :name, :presence => true #The name of the project should be available
  validates :name, :uniqueness => true #The project name should be unique

end
