##
# The Choice model that creates choices for MCQ.
#* *Attributes*    :
# 	-+body+ -> string, saving the title of the questionnaire
#* *Relations*    :
# 	-It belongs to the qquestion.
#
class Choice < ActiveRecord::Base
  belongs_to :qquestion
  attr_accessible :body, :qquestion_id
	validates_presence_of :body
end
