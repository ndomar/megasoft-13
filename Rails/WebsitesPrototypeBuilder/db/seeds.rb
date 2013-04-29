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

# Answers
(0..50).each do
	Answer.create(answer: ('a'..'z').to_a.shuffle[0,20].join, question_id: rand(0..5), page_id: rand(0..5));
end

# cards
(0..50).each do
	Card.create(title: ('a'..'z').to_a.shuffle[0,20].join,
		description: ('a'..'z').to_a.shuffle[0,20].join,
		cardsort_id: rand(0..5));
end

# groups
(0..50).each do
	Group.create(title: ('a'..'z').to_a.shuffle[0,20].join,
		description: ('a'..'z').to_a.shuffle[0,20].join,
		cardsort_id: rand(0..5));
end

# cardsorts
(0..50).each do
	Cardsort.create(title: ('a'..'z').to_a.shuffle[0,20].join,
		description: ('a'..'z').to_a.shuffle[0,20].join,
		project_id: rand(0..5));
end


# choices
(0..50).each do
	Choice.create(body: ('a'..'z').to_a.shuffle[0,20].join,
		qquestion_id: rand(0..5))
end

# comments
(0..50).each do
	Comment.create(body: ('a'..'z').to_a.shuffle[0,20].join,
		assigned_part: ('a'..'z').to_a.shuffle[0,20].join,
		reviewer: rand(0..5), page_id: rand(0..5))
end

# pages
(0..50).each do
	Page.create(page_name: ('a'..'z').to_a.shuffle[0,20].join,
		html: ('a'..'z').to_a.shuffle[0,20].join,
		thumbnail: ('a'..'z').to_a.shuffle[0,20].join)
end

# projects
(0..50).each do
	Project.create(project_name: ('a'..'z').to_a.shuffle[0,20].join,
		project_type: ('a'..'z').to_a.shuffle[0,20].join,
		description: ('a'..'z').to_a.shuffle[0,20].join,
		designer_id: rand(0..5))
end

# qquestions
(0..50).each do
	Qquestion.create(body: ('a'..'z').to_a.shuffle[0,20].join,
		qtype: rand(0..5))
end

# Questionaire
(0..50).each do
	Questionnaire.create(project_id: rand(0..5),
	  title: ('a'..'z').to_a.shuffle[0,20].join)
end

# Reviewer_infos
(0..50).each do
	ReviewerInfo.create(name: ('a'..'z').to_a.shuffle[0,20],
		age: rand(0..18),
		gender: true,
		country: ('a'..'z').to_a.shuffle[0,20],
		day_of_birth: rand(0..30),
		month_of_birth: rand(0..12),
		year_of_birth: rand(0..2013),
		reviewer_id: rand(0..5))
end

# Reviewer
(0..50).each do
	Reviewer.create(email: ('a'..'z').to_a.shuffle[0,20])
end

# Step_answers
(0..50).each do
	StepAnswer.create(successful: true,
		reviewer_id: rand(0..5),
		task_result_id: rand(0..5),
		step_id: rand(0..5))
end

# Step
(0..50).each do
	Step.create(component: ('a'..'z').to_a.shuffle[0,20],
		event: ('a'..'z').to_a.shuffle[0,20],
		description: ('a'..'z').to_a.shuffle[0,20],
		task_id: rand(0..5))
end

# Task_result
(0..50).each do
	TaskResult.create(task_id: rand(0..5),
		reviewer_id: rand(0..5),
		clicks: rand(0..5),
		success: rand(0..5),
		time: rand(0..5))
end

# Task
(0..50).each do
	Task.create(name: ('a'..'z').to_a.shuffle[0,20],
		description: ('a'..'z').to_a.shuffle[0,20],
		project_id: rand(0..5),
		page_id: rand(0..5))
end

# Designers
Designer.create(:fullname => "Test Designer0",
      :email => "designer0@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990,
      :credit_card_number => 1234567891234567,
      :cvv2 => 123)
Designer.create(:fullname => "Test Designer1",
      :email => "designer1@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990,
      :credit_card_number => 1234567891234567,
      :cvv2 => 123)

Designer.create(:fullname => "Test Designer2",
      :email => "designer2@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990,
      :credit_card_number => 1234567891234567,
      :cvv2 => 123)

Designer.create(:fullname => "Test Designer3",
      :email => "designer3@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990,
      :credit_card_number => 1234567891234567,
      :cvv2 => 123)

Designer.create(:fullname => "Test Designer4",
      :email => "designer4@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990,
      :credit_card_number => 1234567891234567,
      :cvv2 => 123)

# Reviewer_Task
(0..50).each do
      Reviewer.find(rand(1..5)).tasks << Task.find(rand(1..5))
end
