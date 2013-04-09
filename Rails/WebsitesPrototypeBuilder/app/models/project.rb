# encoding: utf-8
class Project < ActiveRecord::Base

  ##
  # Attributes:
  # This is the project model 
  # * *Attributes*    :
  #   - +Project_name+-> This is the name of the project
  #   - +type+-> This is the type of the project
  # * *Relations  :
  #   -A project belongs to one designer
  #   -A project has many tasks 
  attr_accessible :description, :project_name, :project_type

  validates :project_name, :presence => {:message => ".برجاء ادخال اسم المشروع"}
  validates :project_name, :uniqueness => {:message => ".يوجد مشروع بهذا الاسم, برجاء ادخال اسم مشروع آخر"}

  has_many :tasks, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  belongs_to :designer


end
