class Project < ActiveRecord::Base
	
  belongs_to :designer

  attr_accessible :name, :project_type, :description

  validates :name, :presence => true
  validates :name, :uniqueness => true

end
