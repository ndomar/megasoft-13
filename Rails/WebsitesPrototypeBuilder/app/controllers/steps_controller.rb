class StepsController < ApplicationController
  def update
    @task =Task.find_by_id(1)
    if params[:change_id].to_s <= @task.steps.last.id.to_s
      @step=@task.steps.find(params[:change_id])
      #@step_answer.step_id=@step.id
      @pre_step = @task.steps.find(params[:change_id].to_f-1)
      @step_answer=@pre_step.step_answers.new
      @step_answer.successful= params[:change_success]
      @step_answer.time_from_start= params[:start_time]
      @step_answer.save

      @task_result= @task.task_results.find(session[:task_result_id])
      @task_result.click= params[:change_clicks]
      @task_result.time_taken=params[:total_time_taken]
      @task_result.save
    else

       #Step.last(1).id <= params[:change_id]
    end
    respond_to do |format|
      if params[:change_id].to_s <= @task.steps.last.id.to_s
        format.html { render :template => "tasks/task_reviewer" }
      else
        format.html { render :template => "tasks/task_reviewer_done" }
      end

    end  
  end
end
