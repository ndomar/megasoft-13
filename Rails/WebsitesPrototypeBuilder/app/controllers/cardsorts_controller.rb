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
		@card = Card.new(params[:card])
		@card.cardsort_id = params[:cardsort_id]
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
		@group = Group.new(params[:group])
		@group.cardsort_id = params[:cardsort_id]
		respond_to do |format|
			if (@group.save)
				format.js {render "new_group", :status => :created}
			else
				format.js {render "new_group", :status => :ok}
			end
		end
	end

	def delete_card
		@card = Cardsort.find(params[:cardsort_id]).cards.find(params[:card_id]);
		@card.destroy
		respond_to do |format|
			format.js { render :nothing => true}
		end
	end

	
	def delete_group
		@group = Cardsort.find(params[:cardsort_id]).groups.find(params[:group_id]);
		@group.destroy
		respond_to do |format|
			format.js { render :nothing => true}
		end
	end
end