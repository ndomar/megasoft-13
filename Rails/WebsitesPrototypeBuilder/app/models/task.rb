class Task < ActiveRecord::Base
  attr_accessible :description, :name, :project
  belongs_to :project

  validates :name, :presence => true

  # belongs_to :project
  # has_many :step
  # has_many :result
  # has_many :reviewer
  # has_many :page
end
