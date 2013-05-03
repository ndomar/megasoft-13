    ##
    # Controller for cardsort pages
    # 

class CardsortsController < ApplicationController
	require 'bcrypt'
	##
	# show a cardsort that has been already created
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

	##
	# create new cardsort from sent parameters
	# * *Args* :
	# - none
	# * *Returns* :
	# - void
	#
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
	
	##
	# deletes a certain card and send a javascruot the removees its icon client side
	# * *Args* :
	# - none
	# * *Returns* :
	# - void
	#
	def delete_card
		@card = Cardsort.find(params[:cardsort_id]).cards.find(params[:card_id]);
		@card.destroy
		respond_to do |format|
			format.js { render "delete_card"}
		end
	end

	##
	# deletes a certain group and send a javascruot the removees its icon client side
	# * *Args* :
	# - none
	# * *Returns* :
	# - void
	#
	def delete_group
		@group = Cardsort.find(params[:cardsort_id]).groups.find(params[:group_id]);
		@group.destroy
		respond_to do |format|
			format.js { render "delete_group"}
		end
	end

	##
	# opens an existing cardosrt for rreiveweing 
	# * *Args* :
	# - none
	# * *Returns* :
	# - void
	#
	def review
		@reviewer = Reviewer.find(params[:reviewer_id])
		@cardsort = Cardsort.find(params[:cardsort_id])
		cardsort_results = (@reviewer.cardsort_results & @cardsort.cardsort_results)
		# if (!cardsort_results.empty?)
		# 	render "/cardsorts/404" and return
		# end
		# begin
		# 	@cardsort.reviewers.find(@reviewer.id)
		# rescue
		# 	render "/cardosrt/506" and return
		# end
		@cards = @cardsort.cards
		@groups = @cardsort.groups
	end

	##
	# submit the review of a cardsort to be save in the database
	# * *Args* :
	# - none
	# * *Returns* :
	# - void
	#
	def submit
		Cardsort.save_results(params[:id], params[:cards], params[:cardsort_id], params[:reviewer_id])
		respond_to do |form|
			form.js {}
		end
	end

	##
	# creates a new group for a cardsort that is begin reviewed called be the reviewer
	# * *Args* :
	# - none
	# * *Returns* :
	# - void
	#
	def reviewer_create_group
		@group = Group.new(params[:group])
		@group.cardsort_id = nil
		@group.save
		respond_to do |form|
			form.js {render "reviewer_new_group"}
		end
	end
end
