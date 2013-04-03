class CardsortsController < ApplicationController
  def new
  	@cardsort = Cardsort.new(params[:cardsort])
  	@cardsort.save
  	@cards = @cardsort.cards
  end

  def edit
  	@cardsort = Cardsort.find(1)
  	@cards = @cardsort.cards
  	render "new"
  end
end
