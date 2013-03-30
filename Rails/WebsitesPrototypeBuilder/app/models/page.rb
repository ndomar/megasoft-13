class Page < ActiveRecord::Base
  attr_accessible :html, :page_name

  def getPageHTML
	self[:html]
  end

end
