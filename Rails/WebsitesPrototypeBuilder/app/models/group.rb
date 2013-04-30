##
# reperesents a group that should be filled with cards 
# in the card sorting system
# * *Attribute* :
# - +title+ -> string representing the id the name of the group
# - +description+ -> string descriping the card
#* *Relations* :
# - belongs to one cardsort
#
class Group < ActiveRecord::Base
  attr_accessible :cardsort_id, :description, :title

  belongs_to :cardsort
  has_and_belongs_to_many :cards
  has_and_belongs_to_many :cardsort_results
  validates :title, :presence => true,
  									:uniqueness => {:scope => :cardsort_id}
  validates :cardsort_id, :presence => true
end