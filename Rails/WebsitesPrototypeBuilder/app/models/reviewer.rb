class Reviewer < ActiveRecord::Base
  
  has_many :task_results
  has_and_belongs_to_many :tasks

  attr_accessible :email
  has_many :invitations
end
