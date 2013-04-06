class Reviewer < ActiveRecord::Base
  attr_accessible :email

  has_one :reviewer_info
  belongs_to :task
end
