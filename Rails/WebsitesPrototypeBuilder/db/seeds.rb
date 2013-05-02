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

#cards_groups
(0..50).each do
  Card.find(rand(1..5)).groups << Group.find(rand(1..5))
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

#cardsortresults
(0..50).each do
  CardsortResult.create(cardsort_id: rand(1..5),
    reviewer_id: rand(1..5),
    group_id: rand(1..5),
    card_id: rand(1..5))
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
    project_id: rand(1..5))
end

# projects
(0..50).each do
	Project.create(project_name: ('a'..'z').to_a.shuffle[0,20].join,
		project_type: ('a'..'z').to_a.shuffle[0,20].join,
		description: ('a'..'z').to_a.shuffle[0,20].join,
		designer_id: rand(1..5))
end

# Questionaire with Qquestions and choices where necessary
(0..50).each do
	Questionnaire.create(project_id: rand(0..5),
	  title: ('a'..'z').to_a.shuffle[0,20].join,
    qquestions_attributes: [{body: "Question A", qtype: 1},
     {body: "Question B", qtype: 2},
     {body: "Question C", qtype: 3,
     choices_attributes: [body: "Choice A"]}, 
     {body: "Question D", qtype: 4, 
     choices_attributes: [{body: "Choice A"}, 
     {body: "Choice B"}, {body: "Choice C"}]}])
end

# AnswerQuestionnaire
(0..200).each do
  randomquestion = Qquestion.find(rand(1..200))
  length = randomquestion.choices.length
  if randomquestion.qtype == 1 || randomquestion.qtype == 2
    body = ('a'..'z').to_a.shuffle[0,20].join
  elsif randomquestion.qtype == 3
    body = randomquestion.choices[rand(0..length-1)].body
  else
    body = randomquestion.choices[0].body + "," + randomquestion.choices[2].body
  end
  AnswerQuestionnaire.create(body: body, 
    qquestion_id: randomquestion.id,
    questionnaire_id: randomquestion.questionnaire_id)
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
		project_id: rand(1..5),
		page_id: rand(1..5),
    time_limit: rand(1..5))
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
