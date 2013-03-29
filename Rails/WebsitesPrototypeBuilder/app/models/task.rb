class Task < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :invitations
  def self.invite (email, invitation_message, task)
    #Sends an email with message (invitation_message) to (task), with a default url linking to google.com for now. 
    #Assures no creation of duplicate reviewer
    @reviewer = Reviewer.find_by_email(email)
    if @reviewer == nil
      @reviewer = Reviewer.create(:email => email) 
    end
    @inv = Invitation.send_invitation(@reviewer, invitation_message, 'www.google.com', task)

  end
end
