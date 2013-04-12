##
# It represents a reviewer in the database
# * *Attribute*    :
#   - +email+ -> the email of the reviewer
#
class Reviewer < ActiveRecord::Base
<<<<<<< HEAD
=======
  
  has_many :task_results
  has_and_belongs_to_many :tasks
  has_one :reviewer_info

>>>>>>> 694252d354501d8eef9ed70df237c82c4ab749e6
  attr_accessible :email
end
