class StepAnswer < ActiveRecord::Base
  belongs_to :reviewer
  belongs_to :task_result
  belongs_to :step
  attr_accessible :successful, :time_from_start
end
