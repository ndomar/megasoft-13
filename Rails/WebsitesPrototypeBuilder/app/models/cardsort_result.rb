class CardsortResult < ActiveRecord::Base
  attr_accessible :cardsort_id, :reviewer_id
  has_and_belongs_to_many :groups
  belongs_to :cardsort
  belongs_to :reviewer
end
