class CardortsReviewerController < ApplicationController
  
    ## 
#It finds groups and cards belonging to a certain cardsort given its id
# * *Args*    :
#   Void
# * *Returns* :
#   Void
#
  def groupsandcards
    @cardsort = Cardsort.find(params[:id])
    @cards = @cardsort.cards
    @groups = @cardsort.groups
  end
end
