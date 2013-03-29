class Reviewer < ActiveRecord::Base
  attr_accessible :email
  has_many :invitations
end
