class Step < ActiveRecord::Base
  belongs_to :task
  attr_accessible :component, :description, :event, :task_id
end
