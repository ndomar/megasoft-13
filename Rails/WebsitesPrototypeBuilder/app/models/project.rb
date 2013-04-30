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

  attr_accessible :description, :project_name, :project_type, :designer_id
  validates :designer_id, :presence => true
  validates :project_name, :presence => {:message => ".برجاء ادخال اسم المشروع"}
  validates :project_name, :uniqueness => {:message => ".يوجد مشروع بهذا الاسم, برجاء ادخال اسم مشروع آخر",:scope => :designer_id}

  has_many :tasks, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  belongs_to :designer

  def get_thumbnail
    # begin
      puts "id:", id
      if File.exists?("app/assets/images/project_#{id}/page_index.png")
        "/assets/project_#{id}/page_index.png"
      else
       "/assets/default.jpg"
      end
  end
end