class TaskController < ApplicationController

  def invite
    #Sends an email to a new/already existing reviewer with an invitation link to take the desired task.
    @inv = Task.invite(params[:email], params[:invitation_message])
    flash[:notice] = @inv.reviewer.email
    render "invitation_list"
  end

  def invitation_list
    #Maps to the user to be filling a task according to his reviewer id.
    #@reviewer = Reviewer.find_by_id[params[:reviewer_id]]
    @invitations = Task.invitations
  end

end
