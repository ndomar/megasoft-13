class Picture < ActiveRecord::Base
  attr_accessible :image, :project_id
  belongs_to :project
end
