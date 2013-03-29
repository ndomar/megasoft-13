class Pages < ActiveRecord::Base
  attr_accessible :HTML, :page_name

  def getPageHTML
    self[:HTML]
  end
  
end
