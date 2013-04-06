class GroupsController < ApplicationController

   ## 
#It assigns variables to groups, card, cardsorts in the databse respectivels
# * *Args*    :
#   Void
# * *Returns* :
#   Void
#
end
   def index
    @groups = Group.all
    @cards = Card.all
    @cardsorts = Cardsort.all
   end
end