class Questionnaire < ActiveRecord::Base
  belongs_to :project
  attr_accessible :title
  has_many :qquestions,:dependent => :destroy
  accepts_nested_attributes_for :qquestions, :reject_if => lambda {|a| a[:body].blank?}, :allow_destroy => true
  attr_accessible :qquestions_attributes
end
