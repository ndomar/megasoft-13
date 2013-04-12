class Qquestion < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :choices,:dependent => :destroy
  accepts_nested_attributes_for :choices, :reject_if => lambda {|a| a[:body].blank?}, :allow_destroy => true
  has_many :answer_questionnaires,:dependent => :destroy
  attr_accessible :body, :number, :qtype, :questionnaire_id,:choices_attributes
end
