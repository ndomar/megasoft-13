class TaskResultsController < ApplicationController
    
  def index
    @task_result = TaskResult.find(params[:id])
    successful_steps = 0
    @task_result.step_answers.each do |solution|
      if solution.successful 
	successful_steps += 1
      end
    end
    number_of_steps = @task_result.step_answers.length
    @task_result.success = successful_steps / number_of_steps
    @task_result.success.save

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end
  
end

