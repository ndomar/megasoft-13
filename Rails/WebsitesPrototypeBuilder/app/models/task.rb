class Task < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project

  validates :name, :presence => true

  ##
  # Task Model
  # * *Attribute* :
  # - +name+ -> name of the task (string)
  # - +description+ -> description of the task (text)
  #* *Relations* :
  # - belongs_to:project
  #
end
