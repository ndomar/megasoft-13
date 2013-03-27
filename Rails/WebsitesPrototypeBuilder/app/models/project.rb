class Project < ActiveRecord::Base
  belongs_to :designer #The project belongs to one designer

  attr_accessible :name, :project_type, :description

  validates :name, :presence => true #The project name should not be empty
  validates :name, :uniqueness => true #The project name should be unique

end
