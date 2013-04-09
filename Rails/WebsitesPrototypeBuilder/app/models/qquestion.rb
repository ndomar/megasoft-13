class Qquestion < ActiveRecord::Base
  belongs_to :questionnaire
  attr_accessible :body, :number, :q_type,:questionnaire_id
  has_many :choices,:dependent => :destroy
  accepts_nested_attributes_for :choices, :reject_if => lambda {|a| a[:body].blank?}, :allow_destroy => true
  has_many :answer_questionnaires,:dependent => :destroy
  attr_accessible :choices_attributes
end
