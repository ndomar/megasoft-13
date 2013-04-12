##
# the answer a user is entering
# * *Attribute*    :
#   - +answer+ -> the reviewer entered his string of answers to be saved
# * *Relations* :
#   - has foreign key to the page and the question
#   - related to one page and one question
class Answer < ActiveRecord::Base
  validates_presence_of :answer
  belongs_to :question
  belongs_to :page
  attr_accessible :answer, :question_id, :page_id
end
