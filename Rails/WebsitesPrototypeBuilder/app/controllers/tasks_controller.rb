class TasksController < ApplicationController

  def task_reviewer
    @task= Task.find_by_id(1)
    @step=@task.steps.find_by_id(1)
    @step_answer=@step.step_answers.new
    @step_answer.save
    @task_result=@task.task_results.new
    @task_result.save
    #@task_res= 
  end
end
