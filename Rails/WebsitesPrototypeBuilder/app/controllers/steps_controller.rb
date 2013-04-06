class StepsController < ApplicationController
  def update
    if params[:change_id].to_s <=Step.last.id.to_s
      @step=Step.find(params[:change_id])
    else
      @step= Step.find_by_id(1)
       #Step.last(1).id <= params[:change_id]
    end
    respond_to do |format|
      format.html { render :template => "tasks/task_reviewer" }
    end  
  end
end
