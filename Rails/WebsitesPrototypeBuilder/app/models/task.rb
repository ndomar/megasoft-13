class Task < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project

  validates :name, :presence => true
end
