class Answer < ActiveRecord::Base
  # related to one page and one question
  validates :answer,:presence => true
  belongs_to :question
  belongs_to :page
  attr_accessible :answer
end
