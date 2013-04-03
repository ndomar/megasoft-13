class Question < ActiveRecord::Base
  attr_accessible :assigned_part, :body, :page_id
  # set it to be a foreign key related to the page table
  belongs_to :page
  # has many answers
  has_many :answers
  #validates that the body isn't empty
  validates :body, :presence => true
  validates :assigned_part, :presence => true
  
end
