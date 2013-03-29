class Page < ActiveRecord::Base
  attr_accessible :html, :name

  def getPageHTML
    self[:html]
  end
end
