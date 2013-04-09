class Choice < ActiveRecord::Base
  belongs_to :qquestion
  attr_accessible :body, :number
  
end
