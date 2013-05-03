##
# represents a media file (vedio/image)
# * *Attribute* :
#  - +url+ -> a path for the given file
#  - +project_id+ -> the project the media file belongs to
#  * *Relations* :
#  - belongs to project
#
class Media < ActiveRecord::Base
  attr_accessible :project_id, :url
  belongs_to :project
  validates_uniqueness_of :url, :scope => :project_id

  def store_media(file_name, data, project_id)
  	if (!Dir.exists?("app/assets/images/project_#{project_id}"))
      Dir.mkdir("app/assets/images/project_#{project_id}")
   end
    @file_content = File.open("app/assets/images/project_#{project_id}/#{file_name}", "wb") do |f|
      f.write(data)
		end
  end
end
