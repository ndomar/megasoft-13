class Task < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project
  belongs_to :page

  validates :name, :presence => true
end
