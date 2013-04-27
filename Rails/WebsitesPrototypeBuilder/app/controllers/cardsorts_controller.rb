    ##
    # Controller for cardsort pages
    # 

class CardsortsController < ApplicationController
	##
	# create new cardsort from sent parameters
	# * *Args* :
  # - none
  # * *Returns* :
  # - void
  #
	def show
		@cardsort = Cardsort.find(params[:cardsort_id])
		@cards = @cardsort.cards
		@groups = @cardsort.groups
		#other_cardsorts = @cardsort.project.cardsorts
	end

	def create_cardsort
		@cardsort = Cardsort.new(params[:cardsort])
		@cardsort.save
		redirect_to "show"
	end

	##
	# creates a new card and sends the javascript that renders to the client
  # * *Args* :
  # - none
  # * *Returns* :
  # - void
  #
	def create_card
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

	##
	# creates a new group and sends the javascript that renders to the client
	# * *Args* :
  # - none
  # * *Returns* :
  # - void
  #
	def create_group
		@group = Group.new(title: params[:title],
			description: params[:desc])
		@group.cardsort_id = session[:cardsort_id]
		respond_to do |format|
			if (@group.save)
				format.js {render "new_group", :status => :created}
			else
				format.js {render "new_group", :status => :ok}
			end
		end
	end
end