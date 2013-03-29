class Reviewer < ActiveRecord::Base
  attr_accessible :email
  has_many :invitations
  validates :email,  :presence => true
end
