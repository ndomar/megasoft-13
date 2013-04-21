class Picture < ActiveRecord::Base
  attr_accessible :image, :project_id
  mount_uploader :image, PictureUploader
end
