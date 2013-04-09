class CardsortsController < ApplicationController
  def new
    @cardsort = Cardsort.new(params[:cardsort])
    @cardsort.save
    @cards = @cardsort.cards
    @card = Card.new
    session[:cardsort_id] = @cardsort.id
  end

  def edit
    @cardsort = Cardsort.find(17)
    @cards = @cardsort.cards
    @card = Card.new
    render "new"
  end

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