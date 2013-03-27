class TaskController < ApplicationController

  def invite
    #Sends an email to a new/already existing reviewer with an invitation link to take the desired task.
    if(params[:email]!=nil) then
      @reviewer = Reviewer.find_by_email(params[:email])
      if @reviewer == nil
        @reviewer = Reviewer.create(:email => params[:email]) 
      end
      Invitation.send_invitation(@reviewer, params[:invitation_message], task_path(:task_id => 1, :reviewer_id => @reviewer.id))
      params[:invitation_email] = "Email sent to " + @reviewer.email 
    end
  end

  def fill_task
    #Maps to the user to be filling a task according to his reviewer id.
    @reviewer = Reviewer.find_by_id[params[:reviewer_id]]
  end

end
