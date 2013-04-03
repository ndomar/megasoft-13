class GroupsController < ApplicationController
   def index
    @groups = Group.all
    @cards = Card.all
    @cardsorts = Cardsort.all
   end
end