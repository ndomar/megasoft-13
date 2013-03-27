class TaskResult < ActiveRecord::Base
  belongs_to :reviewer
  belongs_to :task
  attr_accessible :clicks, :success, :time
end
