##
# represents a cardsort entity
# * *Attribute* :
#  - +description+ -> a short desciption of the card sort and its purpose
#  - +open+ -> boolean to set the type of the cardsort
#  - +project_id+ -> the project the cardsort belongs to
#  - +title+ -> the name of the cardsort
#  * *Relations* :
#  - belongs to project
#
class Cardsort < ActiveRecord::Base
  attr_accessible :description, :open, :project_id, :title
  has_many :cards
  has_many :groups
  belongs_to :project
  has_many :cardsort_results

  def invite(email, msg)
  	begin
  		reviewer = Reviewer.find_by_email(email)
  	rescue
  		reviewer = Reviewer.create(:email => email)
  	end
  	self.reviewers << reviewer
  	ReviewerInviter.cardsort_invitation(email, msg, "http://localhost:3000/cardsorts/review/#{self.id}/reviewer/#{reviewer.id}").deliver()
  end
end
