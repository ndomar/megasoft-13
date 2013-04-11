class TaskController < ApplicationController

  def fill_task
    #Maps to the user to be filling a task according to his reviewer id.
    @reviewer = Reviewer.find_by_id[params[:reviewer_id]]
  end

end
