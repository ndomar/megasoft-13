##
# ActionMailer to send invitations by email
# * *Attribute* :
# - +from+ -> the sender email added to the header
#* *Relations* :
# - none
#
class ReviewerInviter < ActionMailer::Base
  default :from => "Prototyper"

    ##
    # sends a mail to the specified email, carrying
    # a custom invitation to a task
    # * *Args* :
    # - +email+ -> the email to send to
    # - +msg+ -> a custom message for the invitation
    # - +url+ -> url for the task to be taken
    # * *Returns* :
    # - a mail object to be sent
    #
  def task_invitation(email, msg, url)
    @msg = msg
    @url = url
    mail(:to => email, :subject => "Prototyper task invitation")
  end
end
