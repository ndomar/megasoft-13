class Task < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project
  has_many :task_results

  validates :name, :presence => true
end
