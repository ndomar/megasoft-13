class StepsController < ApplicationController
## 
#Author:Sarah
#updates the value of the current step and stores success,clicks,starting time and total time taken in their tables
# * *Args*    :
#   -+@task+ -> the current task
#   -+@step+ -> the current step being executed
#   -+@task_result+ -> a new instance of task_result contains the info about the current task's results
# * *Returns*    :
# - the current task, current step, step_answer for the current_task and task_result for the current task
#
  def update
    @task =Task.find_by_id(params[:task_id])
    returnHash = @task.update_task_results(params,session[:task_result_id])
    if Integer(params[:change_id]) <= Integer(@task.steps.last.id)
      @step = returnHash[:step]
    end
    @task_result=returnHash[:task_result] 
    respond_to do |format|
      if Integer(params[:change_id]) <= Integer(@task.steps.last.id) && Time.parse(@task_result.time) <= Time.parse("0:"+@task.time_limit.to_s+":0")
        format.js{render :nothing => true}
      else
        format.js { render "/tasks/last_step"}
      end
    end
  end
end
