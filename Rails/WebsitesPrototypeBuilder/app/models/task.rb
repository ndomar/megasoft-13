class Task < ActiveRecord::Base
  attr_accessible :description, :name, :project

  validates :project, :presence => true
  validates :name, :presence => true
  # belongs_to :project
  # has_many :step
  # has_many :result
  # has_many :reviewer
  # has_many :page
end
