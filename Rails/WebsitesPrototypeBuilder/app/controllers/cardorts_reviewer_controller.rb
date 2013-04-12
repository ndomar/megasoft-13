class CardortsReviewerController < ApplicationController
  
    ## 
#It finds groups and cards belonging to a certain cardsort given its id
# * *Args*    :
#   Void
# * *Returns* :
#   Void
#
  def groupsandcards
    @cardsort = Cardsort.find(params[:id])
    @cards = @cardsort.cards
    @groups = @cardsort.groups
    session[:cardsort_id] = @cardsort.id
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

  #def show_button
    #@opencardsort = Cardsort.find(params[:id])
    #if @opencardsort.open = 'true'
    #then show button
    #else hide button
  #end
end
