class CardsController < ApplicationController

   ## 
#It intializes cards in the database.
# * *Args*    :
#   Void
# * *Returns* :
#   Void
#
  def index
    @cards = Card.all
   end
end