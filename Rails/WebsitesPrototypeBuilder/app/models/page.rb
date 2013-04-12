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

  belongs_to :project

end
