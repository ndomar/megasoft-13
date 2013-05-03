#encoding: utf-8
class Page < ActiveRecord::Base
	##
	# The Designed Page
	# * *Attribute* :
	# - +html+ -> text, saving the html content of the designed page
	# - +page_name+ -> string, saving the page name
	#
  attr_accessible :html ,:page_name, :project_id
  # set it to contain many comments, when deleted delete all related comments
  has_many :comments,:dependent => :destroy
  # set it to contain many questions, when deleted delete all related questions
  has_many :questions,:dependent => :destroy
  has_many :steps
  has_many :answers,:dependent => :destroy
  belongs_to :project
  #checks that page name is present and is unique
  validates :page_name, :presence => {:message => "  إسم  صفحه موجود"}
  validates :page_name, :uniqueness => {:message => "فريد صفحه إسم"}
  def take_screenshot(url)
    `phantomjs app/assets/javascripts/rasterize.js #{url}?page_id=#{id} page_#{page_name}.png #{project_id}`
    `convert app/assets/images/project_#{project_id}/page_#{page_name}.jpg -resize 200x300 app/assets/images/project_#{project_id}/page_#{page_name}.jpg`
  end
  handle_asynchronously :take_screenshot
  def file_dir_exists?(path_to_file)
    File.exist?(path_to_file)
  end
end