class Reviewer < ActiveRecord::Base
  
  has_many :task_results
  
  attr_accessible :email
  has_many :invitations
end
