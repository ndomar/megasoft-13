##
# Card model represent a card in the card sorting system
# * *Attribute* :
# - +title+ -> string representing the name of the card
# - +description+ -> a string describing the card
#* *Relations* :
# - one to many relation with the cardsort
#
class Card < ActiveRecord::Base
  attr_accessible :cardsort_id, :description, :group_id, :title

  validates :title, :presence => true,
  					:uniqueness => {:scope => :cardsort_id}
  validates :cardsort_id, :presence => true

  belongs_to :cardsort

end
