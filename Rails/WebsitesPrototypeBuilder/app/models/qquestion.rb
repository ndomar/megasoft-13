class Qquestion < ActiveRecord::Base
  ##
	# The Qquestion model that creates questions for questionnaires.
	# * *Attribute* :
	# - +body+ -> string, saving the main question
	# - +qtype+ -> integer, saving the type of the question (Fill,MCQ,checkbox)
	#* *Relations* :
	# - has foreign key to the questionnaire
	# - has many Choices
	# - has nested attributes for Choices so to access choice attributes 
	# - use lambda to check if choice body is empty don't save it in DB
	#
	validates_presence_of :body
	validates_presence_of :qtype
  belongs_to :questionnaire
  attr_accessible :body, :qtype
  has_many :choices,:dependent => :destroy
  accepts_nested_attributes_for :choices, :reject_if => lambda {|a| a[:body].blank?}, :allow_destroy => true
  attr_accessible :choices_attributes
	validate :require_one_choice_if_type3
	validate :require_two_choices_if_type4

  private
	  def require_one_choice_if_type3
	    errors.add(:base, "You must provide at least one choice") if (choices.size < 1 && qtype==3)
	  end

  private
	  def require_two_choices_if_type4
	    errors.add(:base, "You must provide at least two choices") if (choices.size < 2 && qtype==4)
	  end

end
