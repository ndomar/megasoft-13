# A project that has no tasks
project1 = Project.create(:project_name => "Test Project 1")
# A project with a task and no reviewers or task results
project2 = Project.create(:project_name => "Test Project 2")
task1 = project2.tasks.create(:name => "Task 1")
task2 = project2.tasks.create(:name => "Task 2")
# A project with tasks + reviewers + task results + reviewer infos
project3 = Project.create(:project_name => "Test Project 3")
task3 = project3.tasks.create(:name => "Task 3")
task4 = project3.tasks.create(:name => "Task 4")
task5 = project3.tasks.create(:name => "Task 5")
reviewer1 = task3.reviewers.create(:email => "test@test.com")
reviewer2 = task3.reviewers.create(:email => "test@test.com")
reviewer1.create_reviewer_info(:age => 19, :gender => false, :country => "Egypt")
reviewer2.create_reviewer_info(:age => 25, :gender => true, :country => "Libya")
task3.task_results.create(:success => true, :time => 5)
task3.task_results.create(:success => true, :time => 3)
reviewer3 = task4.reviewers.create(:email => "test@test.com")
reviewer4 = task4.reviewers.create(:email => "test@test.com")
reviewer3.create_reviewer_info(:age => 19, :gender => false, :country => "Egypt")
reviewer4.create_reviewer_info(:age => 25, :gender => true, :country => "Libya")
task4.task_results.create(:success => true, :time => 7)
task4.task_results.create(:success => true, :time => 4)
reviewer5 = task5.reviewers.create(:email => "test@test.com")
reviewer6 = task5.reviewers.create(:email => "test@test.com")
reviewer5.create_reviewer_info(:age => 19, :gender => false)
reviewer6.create_reviewer_info(:age => 25, :gender => true)

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