class TaskInvitationController < ApplicationController\

	def invite 		#Generate URL requires reviewer id, so Invitation.send_invitation can't be the one returning the reviewer, must be implemented in previous step
		@reviewer = Reviewer.find_by_email(params[:email])
		if @reviewer == nil
			@reviewer = Reviewer.create(:email => params[:email]) #Where will the email validation go? That the email provided is in correct format?
		end
		@status = Invitation.send_invitation(reviewer.email, params[:invitation_message], generate_url(reviewer.id)) 
		#generate_url should be a method in a tableless model most probably
		#assuming that now send_invitation returns a status (bit/word) indicating successful invtation or not
	end
end
