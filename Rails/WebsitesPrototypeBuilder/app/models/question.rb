class Question < ActiveRecord::Base
  attr_accessible :assigned_part, :body, :page_id
  # set it to be a foreign key related to the page table
  belongs_to :page
  #validates that the body isn't empty
  validates :body, :presence => true
  #validates that the assigned part isn't empty
  validates :assigned_part, :presence => true
    # set it to contain many answer, when deleted delete all related answers
  has_many :answers,:dependent => :destroy
  
end
