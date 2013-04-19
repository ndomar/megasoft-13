##
# The Questionnaire model that creates questions and choices.
#* *Attributes*    :
#   -+title+ -> string, saving the title of the questionnaire
#* *Relations*    :
# 	-has foreign key to the project
# 	-has many to one relation with model project
# 	-has many Questions
# 	-has nested attributes for Qquestions so to access it's attributes 
# 	-use lambda to check if question body is empty don't save it in DB
#
class Questionnaire < ActiveRecord::Base
  belongs_to :project
  has_many :qquestions,:dependent => :destroy
  accepts_nested_attributes_for :qquestions, :reject_if => lambda {|a| a[:body].blank?}, :allow_destroy => true
  attr_accessible :title, :project_id
  attr_accessible :qquestions_attributes
  validates_presence_of :title
	validates :title, :uniqueness => {:scope => :project_id}
	validate :require_one_question

  private
    def require_one_question
      errors.add(:base, "You must provide at least one question") if qquestions.size < 1
    end
end