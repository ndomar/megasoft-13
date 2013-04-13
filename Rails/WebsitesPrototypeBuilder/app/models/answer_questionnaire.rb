##
# the answer a user is entering
# * *Attribute*    :
#   - +answer+ -> the reviewer entered his string of answers to be saved
# * *Relations*    :
#   - has foreign key to the project,questionnaire, and qquestion
#   - related to one page and one question
class AnswerQuestionnaire < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :qquestion
  attr_accessible :body, :qquestion_id, :questionnaire_id
  validates_presence_of :body
end
