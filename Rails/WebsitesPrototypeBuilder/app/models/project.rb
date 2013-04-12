##
# It represents a project in the database
# * *Attribute*    :
#   - +description+ -> describes the project
#   - +time+ -> time taken to finish a task it is of type Time
#   - +project_name+ -> the name of the project
#   - +time+ -> time taken to finish a task it is of type Time
#   - +type+ -> the tyoe of the project
#   - +time+ -> time taken to finish a task it is of type Time
#
class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :type
end
