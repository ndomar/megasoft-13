class Step < ActiveRecord::Base
  ##
  # The steps belonging to a task.
  # * *Attribute* :
  # - +component+ -> string, saving the ID of the component associated with this step.
  # - +description+ -> text, saving the description of what the reviewer should do in this step (can't be empty).
  # - +event+ -> string, saves the event that should be done in this step.
  # - +task_id+ -> integer, saves the id of the task for which this step belongs.
  #* *Relations* :
  # - has foreign key to the page and the reviewer
  # - has many to one relation with model Task.
  #

  belongs_to :task
  attr_accessible :component, :description, :event, :task_id

  validates :description, :presence => true
end
