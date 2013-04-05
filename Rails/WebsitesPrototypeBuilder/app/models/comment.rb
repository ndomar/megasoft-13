class Comment < ActiveRecord::Base
	##
	# The comments saved on part of the design
	# * *Attribute* :
	# - +assigned_part+ -> string, saving the Id of the selected element
	# - +body+ -> text, saving the comment content
	# - +page_id+ -> integer, saves the id of the related page
	# - +reviewer+ -> integer, saves the id of the reviewer who wrote the comment
	#* *Relations* :
	# - has foreign key to the page and the reviewer
	# - has many to one relation with model page
	# - has many to one relation with model reviewer
	#
  attr_accessible :assigned_part, :body, :page_id, :reviewer
  # set it to be a foreign key related to the page table
  belongs_to :page
  #validates that the body isn't empty
  validates :body, :presence => true
  #validates that the assigned part isn't empty
  validates :assigned_part, :presence => true
end
