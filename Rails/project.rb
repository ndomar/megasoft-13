class Proj < ActiveRecord::Base
  attr_accessible :name
  
  def getProjectId
    self[:id]
  end

end
