class Project < ActiveRecord::Base
  attr_accessible :description, :project_name, :type

	def getProjectId
		self[:id]
	end

end
