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
	def new
		@cardsort = Cardsort.new
	end

	def create_cardsort
		@cardsort = Cardsort.new(params[:cardsort])
		@cardsort.save
		@cards = @cardsort.cards
		@groups = @cardsort.groups
		@card = Card.new
		@group = Group.new
		session[:cardsort_id] = @cardsort.id
		@other_cardsorts = @cardsort.project.cardsorts
		render "new"
	end

	##
	# edit a previously made cardsort by id
	# * *Args* :
  # - none
  # * *Returns* :
  # - void
  #
	def edit
		@cardsort = Cardsort.find(params[:crdsrt])
		@other_cardsorts = @cardsort.project.cardsorts
		session[:cardsort_id] = @cardsort.id
		@cards = @cardsort.cards
		@groups = @cardsort.groups
		@card = Card.new
		@group = Group.new
		render "new"
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
	def invite_reviewer
		@email = params[:email]
		@msg = params[:msg]
		invite(email,msg)
		respond_to do |format|
			format.js{}
		end
	end
	def invitations
		@cardsort=Cardsort.find(params[:cardsort_id])
		@reviewers=@cardsort.reviewers
	end
end