#Saves answer in the database
class Answer < ActiveRecord::Base
  attr_accessible :assigned_part, :body, :page_id, :reviewer
  belongs_to :page
  validates :body, :presence => true
end
