class StepsController < ApplicationController
## 
#updates the value of the current step and stores success,clicks,starting time and total time taken in their tables
# * *Args*    :
#   -+@task+ -> the current task
#   -+@step+ -> the current step being executed
#   -+@step_answer+ -> a new instance of step_answer contains the info of the current step
#   -+@task_result+ -> a new instance of task_result contains the info about the current task's results
# * *Returns*    :
# - the current task, current step, step_answer for the current_task and task_result for the current task
#
  def update
    @task =Task.find_by_id(params[:task_id])
    @task.update_taskResults(params,session[:task_result_id])
    returnHash = @task.update_taskResults(params,session[:task_result_id])
    if params[:change_id].to_f <= @task.steps.last.id.to_f
      @step = returnHash[:step]
      @page = returnHash[:page]
      @step_answer=returnHash[:step_answer]
      @task_result=returnHash[:task_result]     
    end
    respond_to do |format|
      if params[:change_id].to_s <= @task.steps.last.id.to_s && Time.parse(@task_result.time) <= Time.parse("0:"+@task.time_limit.to_s+":0")
        format.html { render :template => "tasks/task_reviewer" }
        format.js{render :nothing => true}
      else
        #format.html { render :template => "tasks/task_reviewer_done" }
        format.js { render "/tasks/last_step"}
      end
    end
  end
end
