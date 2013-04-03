# encoding: utf-8
class Project < ActiveRecord::Base

  ##
  # Attributes:
  #  description -> This is the description of the project
  #  Project_name -> This is the name of the project
  #  type - > This is the type of the project
  # Relations :
  #  A project belongs to one designer
  # Validations:
  #  Project name cannot be blank
  #  Project name should be unique
  
  belongs_to :designer
  attr_accessible :description, :project_name, :project_type

  validates :project_name, :presence => {:message => ".برجاء ادخال اسم المشروع"}
  validates :project_name, :uniqueness => {:message => ".يوجد مشروع بهذا الاسم, برجاء ادخال اسم مشروع آخر"}
end
