# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Seeds for C2S1 Create Task Story.
project1 = Project.create(:project_name => "Test Project 1")
page1 = project1.pages.create(:page_name => "Test Page 1")

project2 = Project.create(:project_name => "Test Project 2")

# Seeds for C2S11 Statistics Story

# Case#1 Task + Reviewers + Reviewer Info + Task Results
task1 = project1.tasks.create(:name => "Test Task 1")
reviewer11 = task1.reviewers.create(:email => "reviewer11@blabla.com")
reviewer12 = task1.reviewers.create(:email => "reviewer12@blabla.com")
reviewer11.create_reviewer_info(:age => 19, :gender => 1, :country => "Egypt")
reviewer12.create_reviewer_info(:age => 22, :gender => 0, :country => "Canada")
task1.task_results.create(:success => 1, :time => 2, :reviewer_id => reviewer11.id)
task1.task_results.create(:success => 1, :time => 4, :reviewer_id => reviewer12.id)
# Case#2 Task + Reviewers + Incomplete Reviewer Info + Task Results
task2 = project1.tasks.create(:name => "Test Task 2")
reviewer21 = task2.reviewers.create(:email => "reviewer21@blabla.com")
reviewer22 = task2.reviewers.create(:email => "reviewer22@blabla.com")
reviewer21.create_reviewer_info(:age => 19, :country => "Egypt")
reviewer22.create_reviewer_info(:gender => 0, :country => "Canada")
task2.task_results.create(:success => 1, :time => 5, :reviewer_id => reviewer21.id)
task2.task_results.create(:success => 1, :time => 7, :reviewer_id => reviewer22.id)
# Case#3 Task + Reviewers
task3 = project1.tasks.create(:name => "Test Task 3")
reviewer31 = task3.reviewers.create(:email => "reviewer31@blabla.com")
reviewer32 = task3.reviewers.create(:email => "reviewer32@blabla.com")
# Case#4 Task with no reviewers at all
task4 = project1.tasks.create(:name => "Test Task 4")

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