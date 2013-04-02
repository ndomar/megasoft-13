class CardsortsController < ApplicationController
  def new
  	@cardsort = Cardsort.new(params[:cardsort]);
  	@cardsort.save
  end
end
