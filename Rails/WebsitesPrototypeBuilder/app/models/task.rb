class Task < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :project
  # has_many :steps
  # has_many :results
  # has_many :reviewers

  validates :name, :presence => true
end
