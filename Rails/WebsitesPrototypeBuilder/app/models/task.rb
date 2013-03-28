class Task < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :invitations, :inverse_of => :task

  def self.invite (email, invitation_message)
    @reviewer = Reviewer.find_by_email(email)
    if @reviewer == nil
      @reviewer = Reviewer.create(:email => email) 
    end
    #@inv = Invitation.send_invitation(@reviewer, invitation_message, task_path(:task_id => 1, :reviewer_id => @reviewer.id))
    @inv = Invitation.send_invitation(@reviewer, invitation_message, 'www.google.com')

  end

end
