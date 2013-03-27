class TaskResultsController < ApplicationController
  def index
    @tasks = Task.find(params [:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end
  
end
