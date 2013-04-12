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
end
