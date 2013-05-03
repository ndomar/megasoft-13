
# Answers
(0..10).each do |i|
Answer.create(answer: "answer#{i}", question_id: (i%3), page_id: (i%3));
end

# cards
(0..10).each do |i|
Card.create(title: "card#{i}", description: "description#{i}",
cardsort_id: (i%3));
end

# groups
(0..10).each do |i|
Group.create(title: "group#{i}", description: "description#{i}",
cardsort_id: (i%3));
end

#cards_groups
(0..10).each do |i|
  Card.find(rand(1..5)).groups << Group.find(rand(1..5))
end

# cardsorts
(0..10).each do |i|
Cardsort.create(title: "cardsort#{i}", description: "description#{i}",
project_id: (i%3));
end

# choices
(0..10).each do |i|
Choice.create(body: "choice#{i}", qquestion_id: (i%3))
end

#cardsortresults
(0..10).each do |i|
  CardsortResult.create(cardsort_id: (i%3),
    reviewer_id: (i%3),
    group_id: (i%3),
    card_id: (i%3))
end

# comments
(0..10).each do |i|
Comment.create(page_id: (i%3), reviewer: (i%3),
    assigned_part: "element#{i}", body: "comment#{i}")
end

# Reviewer
(0..10).each do |i|
  Reviewer.create(email: "email#{i}@gmail.com")
end

# Step_answers
(0..10).each do |i|
  StepAnswer.create(successful: true,
    reviewer_id: (i%3),
    task_result_id: (i%3),
    step_id: (i%3))
end


# Step
(0..10).each do |i|
  Step.create(component: "element#{i}",
    event: "onclick", description:"description#{i}",
    task_id: (i%3), page_id: (i%3))
end

# pages
(0..10).each do |i|
Page.create(page_name: "page#{i}",
html: "<input>",
    project_id: (i%3))
end

# projects
(0..10).each do |i|
Project.create(project_name: "project#{i}", project_type: "type{i}",
description: "description#{i}",
designer_id: (i%3))
end

# Questionaire with Qquestions and choices where necessary
(0..10).each do |i|
Questionnaire.create(project_id: (i%3),
title: "questionaire#{i}",
    qquestions_attributes: [{body: "Question A", qtype: 1},
     {body: "Question B", qtype: 2},
     {body: "Question C", qtype: 3,
     choices_attributes: [body: "Choice A"]},
     {body: "Question D", qtype: 4,
     choices_attributes: [{body: "Choice A"},
     {body: "Choice B"}, {body: "Choice C"}]}])
end

# Reviewer_infos
(0..10).each do |i|
ReviewerInfo.create(name: "reviewer#{i}",
age: rand(0..18),
gender: true,
country: ('a'..'z').to_a.shuffle[0,20],
day_of_birth: rand(0..30),
month_of_birth: rand(0..12),
year_of_birth: rand(0..2013),
reviewer_id: rand(0..5))
end

# Reviewer
(0..10).each do |i|
Reviewer.create(email: "email#{i}@gmail.com")
end

# Step_answers
(0..10).each do |i|
StepAnswer.create(successful: true,
reviewer_id: (i%3),
task_result_id: (i%3),
step_id: (i%3))
end

# Step
(0..10).each do |i|
Step.create(component: "element#{i}",
event: "onclick",
description: "description#{i}",
task_id: (i%3))
end

# Task_result
(0..10).each do |i|
TaskResult.create(task_id: (i%3),
reviewer_id: (i%3),
clicks: (i%3),
success: ((i%3) == 0),
time: (i%3))
end

# Task
(0..10).each do |i|
Task.create(name: "task#{i}",
description: "description#{i}",
project_id: (i%3),
page_id: (i%3),
    time_limit: (i%3))
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
      :year_dob => 1990)
Designer.create(:fullname => "Test Designer1",
      :email => "designer1@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990)

Designer.create(:fullname => "Test Designer2",
      :email => "designer2@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990)

Designer.create(:fullname => "Test Designer3",
      :email => "designer3@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990)

Designer.create(:fullname => "Test Designer4",
      :email => "designer4@gmail.com",
      :password => "pass1234",
      :password_confirmation => "pass1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 15,
      :month_dob => 10,
      :year_dob => 1990)

# Reviewer_Task
(0..10).each do |i|
      Reviewer.find((i%3)+1).tasks << Task.find((i%3)+1)
end

(0..10).each do |i|
  Cardsort.find((i%3)+1).reviewers << Reviewer.find((i%3)+1)
end

#Maged's Seeds

maged = Designer.create(:fullname => "Maged Shalaby",
      :email => "maged@gmail.com",
      :password => "maged1234",
      :password_confirmation => "maged1234",
      :phone_number => "01004509771",
      :country => "Egypt",
      :day_dob => 18,
      :month_dob => 9,
      :year_dob => 1993)

magedProject = Project.create(:project_name => "Maged's Project", :designer_id => maged.id)
page1 = " '<html><head><title>Home</title></head><bodydata-id='1'style='background-color:white'><h1>Home</h1><imgsrc='images/myimage.jpg'><br>' +
'<a href='home.html'>Home</a>'+
'<a href='second.html'>Second</a>'+
'<ahref='third.html'>third</a>'+
'</body>'+
'</html>'"
magedPage1 = Page.create(:page_name => "home",:project_id => magedProject.id, :html => page1)

page2 = "<html><head><title>Home</title></head><body data-id='2' style='background-color:white'><h1> Secojnbd </h1><img src='images/myimage.jpg'><br><a href='home.html'>Home</a><a href='second.html'>Second</a><a href='third.html'>third</a></body></html>"
magedPage2 = Page.create(:page_name => "second",:project_id => magedProject.id, :html => page2)
