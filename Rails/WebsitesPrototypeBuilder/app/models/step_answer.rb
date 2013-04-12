##
# each instance of this model represents an answer of one step done by one user
#* *Attributes*    :
#   -+successful+ -> shows if the step is done correctly or not of type boolean
#   -+time_from_start+ -> time taken to solve this step from the begining of the task
#* *Relations*    :
#   -it belongs to a single step
#   -it belongs to a reviewer 
#   -it belongs to a single task_result


class StepAnswer < ActiveRecord::Base
  belongs_to :reviewer
  belongs_to :task_result
  belongs_to :step
  attr_accessible :successful, :time_from_start
end
