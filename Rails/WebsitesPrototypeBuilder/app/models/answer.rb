class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :page
  attr_accessible :answer
end
