class StepsController < ApplicationController

  ## 
#updates the value of the current step and stores success,clicks,starting time and total time taken in their tables
# * *Args* :
# - +@task+ -> the current task
# - +@step+ -> the current step being executed
# - +@step_answer+ -> a new instance of step_answer contains the info of the current step
# - +@task_result+ -> a new instance of task_result contains the info about the current task's results
# * *Returns* :
# - the current task, current step, step_answer for the current_task and task_result for the current task
#
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
      
      @page= Page.find_by_id(1)
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
