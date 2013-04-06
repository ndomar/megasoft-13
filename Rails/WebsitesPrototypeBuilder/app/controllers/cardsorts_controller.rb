class CardsortsController < ApplicationController
	def new
		@cardsort = Cardsort.new(params[:cardsort])
		@cardsort.save
		@cards = @cardsort.cards
		@groups = @cardsort.groups
		@card = Card.new
		@group = Group.new
		session[:cardsort_id] = @cardsort.id
	end

	def edit
		@cardsort = Cardsort.find(17)
		@cards = @cardsort.cards
		@groups = @cardsort.groups
		@card = Card.new
		@group = Group.new
		render "new"
	end

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
