# encoding: utf-8
class Project < ActiveRecord::Base

  ##
  # This is the project model 
  # * *Attributes*    :
  #   - +Project_name+-> This is the name of the project
  #   - +type+-> This is the type of the project
  # * *Relations  :
  #   -A project belongs to one designer
  #   -A project has many tasks 
  #   -A project has many medias
  #   -A project has many pages 
  #   -A project has many cardsorts

  attr_accessible :description, :project_name, :project_type, :designer_id
  validates :designer_id, :presence => true
  validates :project_name, :presence => {:message => ".برجاء ادخال اسم المشروع"}
  validates :project_name, :uniqueness => {:message => ".يوجد مشروع بهذا الاسم, برجاء ادخال اسم مشروع آخر",:scope => :designer_id}

  has_many :tasks, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  has_many :medias
  has_many :cardsorts, :dependent => :destroy
  belongs_to :designer

  ## 
  # get_thumbnail, The project view consists of screenshots of each of the specified designer's projects. A default image is shown if they have no pages yet
  # * *Args*    :
  #   - void
  # * *Returns* :
  #   - void.

  def get_thumbnail
    puts "id:", id
    if File.exists?("app/assets/images/project_#{id}/page_index.png")
      "/assets/project_#{id}/page_index.png"
    else
      "/assets/default.jpg"
    end
  end

end