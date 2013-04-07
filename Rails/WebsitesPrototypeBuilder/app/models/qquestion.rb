class Qquestion < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :project
  attr_accessible :body, :number, :type
end
