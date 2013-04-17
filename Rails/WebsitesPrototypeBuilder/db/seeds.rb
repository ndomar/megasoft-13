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