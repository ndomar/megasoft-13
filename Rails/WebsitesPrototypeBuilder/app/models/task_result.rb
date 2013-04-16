##
# each instance of this model represents the result of one task
#* *Attributes*    :
#   -+clicks+ -> number of  clicks the user clicked when solving the task it is of type intger
#   -+time+ -> time taken to solve the task it is of type time
#   -+success+ -> the percentage of the the steps of the task done correctly it is  of type float
#* *Relations*    :
#   -has a many to one relation with model task
#   -has a many to one relation with model reviewer
class TaskResult < ActiveRecord::Base
  belongs_to :reviewer
  belongs_to :task
  has_many :step_answers
  attr_accessible :clicks, :success, :time, :reviewer_id
end
