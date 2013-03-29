class Task < ActiveRecord::Base
  attr_accessible :name
  has_many :task_results
end
