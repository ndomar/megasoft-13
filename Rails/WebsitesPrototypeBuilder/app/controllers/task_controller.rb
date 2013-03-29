class TaskController < ApplicationController

  def invite_user
    #Sends an email to a new/already existing reviewer with an invitation link to take the desired task.
    @inv = Task.invite(params[:email], params[:invitation_message], Task.find_by_id(params[:id]))
    redirect_to :action =>'invite', :id => params[:id]
  end

  def invite
    #Renders form to display invited users to task, as well as allow inviting new reviewers
    @task = Task.find_by_id(params[:id])
    @invitations = @task.invitations
  end

  def fill_task
    #Renders view of page to reviewer to fill task
    @task = Task.find_by_id(params[:task_id])
    @reviewer = Reviewer.find_by_id(params[:reviewer_id])
  end

end
