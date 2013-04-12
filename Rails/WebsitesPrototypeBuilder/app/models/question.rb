##
# The question saved on part of the design
#* *Attributes*    :
# 	-+assigned_part+ -> string, saving the Id of the selected element
# 	-+body+ -> text, saving the question content
# 	-+page_id+ -> integer, saves the id of the related page
#* *Relations*    :
# 	-has foreign key to the page and the reviewer
# 	-has many to one relation with model page
#
class Question < ActiveRecord::Base
  attr_accessible :assigned_part, :body, :page_id
  belongs_to :page
  # Each question has many answers
  has_many :answers,:dependent => :destroy
  #validates that the body isn't empty
  validates :body, :presence => true, :length => { :maximum => 8000 }
  #validates that the assigned part isn't empty
  validates :assigned_part, :presence => true  
end
