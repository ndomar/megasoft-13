class Questionnaire < ActiveRecord::Base
  ##
	# The Questionnaire model that creates questions and choices.
	# * *Attribute* :
	# - +title+ -> string, saving the title of the questionnaire
	#* *Relations* :
	# - has foreign key to the project
	# - has many to one relation with model project
	# - has many Questions
	# - has nested attributes for Qquestions so to access it's attributes 
	# - use lambda to check if question body is empty don't save it in DB
	#
  belongs_to :project
  attr_accessible :title
  has_many :qquestions,:dependent => :destroy
  accepts_nested_attributes_for :qquestions, :reject_if => lambda {|a| a[:body].blank?}, :allow_destroy => true
  attr_accessible :qquestions_attributes
end