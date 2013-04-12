class Step < ActiveRecord::Base
  belongs_to :task
  has_many :step_answers
  attr_accessible :component, :description, :event
  has_many :step_answers

end
