class Reviewer < ActiveRecord::Base
  attr_accessible :mail
  has_many :task_results
end
