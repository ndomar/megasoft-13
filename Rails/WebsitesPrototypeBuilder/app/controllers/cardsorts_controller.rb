class CardsortsController < ApplicationController
	def new
		@cardsort = Cardsort.new(params[:cardsort])
		@cardsort.save
		@cards = @cardsort.cards
		@card = Card.new
	end

	def edit
		@cardsort = Cardsort.find(1)
		@cards = @cardsort.cards
		@card = Card.new
		render "new"
	end

	def create
		@card = Card.new
		@card.title = params[:title]
		@card.description = params[:desc]
		@card.cardsort_id = @cardsort.id
		@card.save
		render :nothing => true
	end
end
