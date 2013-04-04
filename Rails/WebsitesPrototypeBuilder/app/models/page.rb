class Page < ActiveRecord::Base
  attr_accessible :page_name, :html, :project_id

	#Association
  	belongs_to :project
end
