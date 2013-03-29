class Task < ActiveRecord::Base
  has_many :pages
  has_many :task_results
  belongs_to :designer
  attr_accessible :description, :name
end
