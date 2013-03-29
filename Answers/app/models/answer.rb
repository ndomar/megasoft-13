#Saves answer in the database
class Answer < ActiveRecord::Base
  attr_accessible :assigned_part, :body, :page_id, :question_id, :reviewer
  belongs_to :question
  validates :body, :presence => true
end
