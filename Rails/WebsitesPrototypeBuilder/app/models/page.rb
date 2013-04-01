class Page < ActiveRecord::Base
  # attr_accessible :title, :body

  #Associations
  belongs_to :project
  
end
