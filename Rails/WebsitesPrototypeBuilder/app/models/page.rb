
class Page < ActiveRecord::Base
  ##
  # The Designed Page
  # * *Attribute* :
  # - +html+ -> text, saving the html content of the designed page
  # - +page_name+ -> string, saving the page name
  #
  attr_accessible :html ,:page_name, :project_id, :thumbnail
  validates_presence_of :page_name
  validates :page_name, :uniqueness => {:scope => :project_id}
  # set it to contain many comments, when deleted delete all related comments
  has_many :comments,:dependent => :destroy
  # set it to contain many questions, when deleted delete all related questions
  has_many :questions,:dependent => :destroy
  has_many :steps
  has_many :tasks
  has_many :steps
  has_many :answers,:dependent => :destroy
  belongs_to :project

  def file_dir_exists?(path_to_file)
    File.exist?(path_to_file)
  end
  def take_screenshot(url)
    `phantomjs /app/assets/javascripts/rasterize.js #{url} ll #{page_name}`
    `convert app/assets/images/page_ll.jpg -resize 200x300 app/assets/images/page_ll.jpg`
  end
  handle_asynchronously :take_screenshot
  
end

