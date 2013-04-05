class Reviewer < ActiveRecord::Base
  attr_accessible :email

  belongs_to :task
end
