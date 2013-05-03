class Log < ActiveRecord::Base
  belongs_to :task_result
  attr_accessible :action, :time, :component_involved
end
