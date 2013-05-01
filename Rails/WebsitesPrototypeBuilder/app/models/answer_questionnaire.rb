##
# the answer a user is entering
# * *Attribute*    :
#   - +body+ -> the reviewer entered his string of answer to be saved
# * *Relations*    :
#   - has foreign key to the questionnaire 
# 	- has foreign key to the qquestion
#   - related to one questionnaire
class AnswerQuestionnaire < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :qquestion
  attr_accessible :body, :qquestion_id, :questionnaire_id
  validates_presence_of :body
end
