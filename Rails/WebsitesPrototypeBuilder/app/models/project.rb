class Project < ActiveRecord::Base
  belongs_to :designer

  attr_accessible :description, :project_name, :type

  validates :project_name, :presence => true
  validates :project_name, :uniqueness => true

  has_many :tasks, :dependent => :destroy

end