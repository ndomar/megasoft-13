class TaskResult < ActiveRecord::Base
  attr_accessible :clicks, :success, :time_frame

  belongs_to :task

end
