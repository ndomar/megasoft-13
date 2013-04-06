##
# It represents a reviewer in the database
# * *Attribute*    :
#   - +email+ -> the email of the reviewer
#
class Reviewer < ActiveRecord::Base
  attr_accessible :email
end
