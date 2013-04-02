# encoding: utf-8
class Project < ActiveRecord::Base
  belongs_to :designer
  attr_accessible :description, :project_name, :project_type

  validates :project_name, :presence => {:message => ".برجاء ادخال اسم المشروع"}
  validates :project_name, :uniqueness => {:message => ".يوجد مشروع بهذا الاسم, برجاء ادخال اسم مشروع آخر"}
end
