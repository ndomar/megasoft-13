class CardsortsController < ApplicationController
  def index
    @cardsorts = Cardsort.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cardsorts }
    end
  end