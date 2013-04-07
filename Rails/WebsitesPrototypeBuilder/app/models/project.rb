class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :type

  has_many :tasks, :dependent => :destroy

  has_many :questionnaires,:dependent => :destroy

end
