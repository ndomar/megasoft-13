class Card < ActiveRecord::Base
  attr_accessible :cardsort_id, :description, :group_id, :title

  validates :title, :presence => true,
  					:uniqueness => true
  validates :cardsort_id, :presence => true

  belongs_to :cardsort

end
