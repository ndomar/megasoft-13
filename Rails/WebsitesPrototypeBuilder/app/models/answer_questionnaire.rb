class AnswerQuestionnaire < ActiveRecord::Base
##
# the answer a user is entering
# * *Attribute* :
#   - +answer+ -> the reviewer entered his string of answers to be saved
# * *Relations* :
#   - has foreign key to the project,questionnaire, and qquestion
#   - related to one page and one question
  belongs_to :project
  belongs_to :questionnaire
  belongs_to :qquestion
  attr_accessible :answer, :string
end
