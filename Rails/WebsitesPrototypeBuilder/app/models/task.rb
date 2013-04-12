class Task<ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :project
  belongs_to :page
  has_many :steps
  has_many :task_results
  has_and_belongs_to_many :reviewers
  validates :name, :presence => true
end
