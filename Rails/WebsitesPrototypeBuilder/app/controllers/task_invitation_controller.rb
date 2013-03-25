class TaskInvitationController < ApplicationController

	def invite 		#Generate URL requires reviewer id, so Invitation.send_invitation can't be the one returning the reviewer, must be implemented in previous step
		#REGEX validation in controller?
		@reviewer = Reviewer.find_by_email(params[:email])
		if @reviewer == nil
			@reviewer = Reviewer.create(:email => params[:email]) #Where will the email validation go? That the email provided is in correct format?
			#Is it rails standard to have simple validation in front end?
		end
		@status = Invitation.send_invitation(@reviewer.email, params[:invitation_message], Url_generator.generate_task_url(reviewer.id)) 
		#generate_url should be a method in a tableless model/class/module most probably
		#assuming that now send_invitation returns a status (bit/word) indicating successful invtation or not
	end


end
