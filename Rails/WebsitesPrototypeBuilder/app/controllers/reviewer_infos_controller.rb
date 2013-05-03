class ReviewerInfosController < ApplicationController
## 
#Author:Sarah
#creates a new instance of the reviewer_infos
# * *Args*    :
#   -+@reviewer+ -> the current reviewer
#   -+@reviewer_info+ -> the new instance of reviewer_infos
# * *Returns*    :
# - nothing
#
  def new
  @reviewer= Reviewer.find(params[:reviewer_id])
  @reviewer_info=ReviewerInfo.new(params[:reviewer_info])
  @reviewer_info.reviewer_id=@reviewer.id
  @reviewer_info.save
  respond_to do |format|
    format.js {render :nothing => true}
  end  
  end
end
