# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 @project = Project.new
 @project.project_name = "project1"
 @project.designer_id = 1
 @project.save

 @cardsort = Cardsort.new
 @cardsort.title = "cardsort1"
 @cardsort.save

 @page = Page.new
 @page.html = "<button>Samy</button>"
 @page.project_id = 1
 @page.save


 @task = Task.new
 @task.name = "task1"
 @task.project_id = 1
 @task.page_id = 1
 @task.save

 @step=Step.new
 @step.task_id=1
 @step.component='cmp'
 @step.event='click'
 @step.description='click on (Step1 cmp)'
 @step.save


@step2=Step.new
 @step.task_id=1
 @step.component='cmp2'
 @step.event='mouseover'
 @step.description='hover on (Step2 cmp)'
 @step.save

 @reviewer=Reviewer.new
 @reviewer.save

@task_result = TaskResult.new
@task_result.task_id = 1
@task_result.time = 1.2
@task_result.clicks = 200
@task_result.reviewer_id = 1
@task_result.save

@step_answer = StepAnswer.new
@step_answer.task_result_id = 1
@step_answer.successful = true
@step_answer.time_from_start = 2.2
@task_result.save

@step_answer2 = StepAnswer.new
@step_answer2.task_result_id = 1
@step_answer2.successful = false
@step_answer2.time_from_start = 3.3
@step_answer2.save