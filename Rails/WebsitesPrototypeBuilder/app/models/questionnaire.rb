class Questionnaire < ActiveRecord::Base
  belongs_to :project
  has_many :qquestions,:dependent => :destroy
  has_many :answer_questionnaires,:dependent => :destroy
  accepts_nested_attributes_for :qquestions, :reject_if => lambda {|a| a[:body].blank?}, :allow_destroy => true
  attr_accessible :qquestions_attributes, :title
end
