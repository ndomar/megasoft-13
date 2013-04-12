    ##
    # Controller for cardsort pages
    # 

class CardsortsController < ApplicationController
	##
	# creates a new cardsort
  # * *Args* :
  # - none
  # * *Returns* :
  # - void
  #
	def new
		@cardsort = Cardsort.new(params[:cardsort])
		@cardsort.save
		@cards = @cardsort.cards
		@card = Card.new
		session[:cardsort_id] = @cardsort.id
	end

	##
	# edits a previously made cardsort 
  # * *Args* :
  # - none
  # * *Returns* :
  # - void
  #
	def edit
		@cardsort = Cardsort.find(17)
		@cards = @cardsort.cards
		@card = Card.new
		render "new"
	end

	##
	# creates a new card and sends the javascript that renders to the client
  # * *Args* :
  # - none
  # * *Returns* :
  # - void
  #
	def create
		@card = Card.new(title: params[:title],
			description: params[:desc])
		@card.cardsort_id = session[:cardsort_id]
		respond_to do |format|
			if (@card.save)
				format.js {render "new_card", :status => :created}
			else
				format.js {render "new_card", :status => :ok}
			end
		end
	end
end
