class Question < ActiveRecord::Base
	##
	# The question saved on part of the design
	# * *Attribute* :
	# - +assigned_part+ -> string, saving the Id of the selected element
	# - +body+ -> text, saving the question content
	# - +page_id+ -> integer, saves the id of the related page
	#* *Relations* :
	# - has foreign key to the page and the reviewer
	# - has many to one relation with model page
	#
  belongs_to :page
  #validates that the body isn't empty
  validates :body, :presence => true
  #validates that the assigned part isn't empty
  validates :assigned_part, :presence => true
  # set it to contain many answer, when deleted delete all related answers
  has_many :answers,:dependent => :destroy
  
end
