    ##
    # Controller for cardsort pages
    # 

class CardsortsController < ApplicationController
    ## 
    # The page opened once a new cardsort is sent 
    # to add cards
    # * *Args* :
    # - void
    # * *Returns* :
    # - void
    #
  def new
  	@cardsort = Cardsort.new(params[:cardsort]);
  	@cardsort.save
  end
end
