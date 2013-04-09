class Qquestion < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :project
  attr_accessible :body, :number, :q_type,:questionnaire_id
  has_many :choice_qquestions,:dependent => :destroy
  has_many :answer_questionnaires,:dependent => :destroy
end
