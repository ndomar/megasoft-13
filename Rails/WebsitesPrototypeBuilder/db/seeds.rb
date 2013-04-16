# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

project1 = Project.create(:project_name => "Test Project 1")
page1 = project1.pages.create(:page_name => "Test Page 1")

project2 = Project.create(:project_name => "Test Project 2")