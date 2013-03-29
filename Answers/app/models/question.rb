class Question < ActiveRecord::Base
  attr_accessible :assigned_part, :body, :page_id, :reviewer
  has_many :answers
  belongs_to :page
  validates :body, :presence => true
end