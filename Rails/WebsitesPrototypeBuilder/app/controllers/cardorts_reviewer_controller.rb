class CardortsReviewerController < ApplicationController
  def groupsandcards
    @cardsort = Cardsort.find(params[:id])
    @cards = @cardsort.cards
  end
end
