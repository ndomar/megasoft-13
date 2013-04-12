class Step < ActiveRecord::Base
  belongs_to :task
  attr_accessible :component, :description, :event
  has_many :step_answers

end
