class Project < ActiveRecord::Base
  
# def require_correct_designer(pid , did)
#      @project = Project.find(:all, :conditions => {:project_id => pid , :designer_id => did}) 
#     if(@project != nil)
#       return true
#     else
#       return false
#     end
#   end


  attr_accessible :description, :project_name, :project_type

  has_many :tasks, :dependent => :destroy
  #set the project to have many pages
  has_many :pages

end