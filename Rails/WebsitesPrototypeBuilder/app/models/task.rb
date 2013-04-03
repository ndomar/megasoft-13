class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :page
  attr_accessible :description, :name
end
