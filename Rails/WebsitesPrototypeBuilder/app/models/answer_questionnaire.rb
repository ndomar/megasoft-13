class AnswerQuestionnaire < ActiveRecord::Base
  belongs_to :project
  belongs_to :questionnaire
  belongs_to :qquestion
  attr_accessible :answer, :string
end
