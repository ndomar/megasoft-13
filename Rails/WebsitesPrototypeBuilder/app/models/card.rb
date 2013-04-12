##
# It represents cards of a cardsorting event in the database
# * *Attribute*    :
#   - +description+ -> describes the card
#   - +time+ -> time taken to finish a task it is of type Time
#   - +title+ -> the name of the card
#   - +time+ -> time taken to finish a task it is of type Time
# * *Relations* :

#   - has many to one relation with model cardsort
#   - has many to one relation with model group
#
class Card < ActiveRecord::Base
  attr_accessible :cardsort_id, :description, :group_id, :title

  belongs_to :cardsort
  belongs_to :group

## 
#This method finds all cards belonging to a certain cardsort
# * *Args*    :
#none
# * *Returns* :
#   none
#
  def find
    @cardsort = Cardsort.find(params[:cardsort_id])
    @card = @cardsort.cards.find(:all)
    redirect_to card_path(@card)
   end
end
