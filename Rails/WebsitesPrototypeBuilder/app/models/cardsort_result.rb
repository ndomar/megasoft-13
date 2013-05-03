class CardsortResult < ActiveRecord::Base
  attr_accessible :cardsort_id, :reviewer_id, :card_id, :group_id
  belongs_to :cardsort
  belongs_to :reviewer
  belongs_to :card
  belongs_to :group
end
