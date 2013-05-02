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
  has_and_belongs_to_many :reviewers

  def self.save_results(ids, cards, cardsort, reviewer)
    ids.each_with_index do |id, index|
      next if cards["#{index}"] == nil
  		cards["#{index}"].each do |card|
  			cardsort_result = CardsortResult.new
  			cardsort_result.reviewer_id = reviewer
  			cardsort_result.cardsort_id = cardsort
  			cardsort_result.card_id = card
  			cardsort_result.group_id = group
  			cardsort_result.save
  		end
  	end
  end

  def invite(email, msg)
	reviewer = Reviewer.find_by_email(email)
	if (reviewer == nil)
		reviewer = Reviewer.create(:email => email)
  	end
  	self.reviewers << reviewer
  	ReviewerInviter.cardsort_invitation(email, msg, "http://localhost:3000/cardsorts/review/#{self.id}/reviewer/#{reviewer.id}").deliver()
  end
end
