class Choice < ActiveRecord::Base
  ##
	# The Choice model that creates choices for MCQ.
	# * *Attribute* :
	# - +body+ -> string, saving the title of the questionnaire
	#* *Relations* :
	# - It belongs to the qquestion.
	#
  belongs_to :qquestion
  attr_accessible :body
	validates_presence_of :body
end
