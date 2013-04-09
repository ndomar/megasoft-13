class Questionnaire < ActiveRecord::Base
  belongs_to :project
  attr_accessible :title
  has_many :qquestions,:dependent => :destroy
  has_many :choice_qquestions,:dependent => :destroy
  has_many :answer_questionnaires,:dependent => :destroy
end
