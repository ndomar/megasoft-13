    class SendNotification < ActionMailer::Base
    default :from => "Prototyper"
    ##
    # sends a mail to the designer
    # * *Args* :
    # - +email+ -> the email to send to
    # - +comment+ -> the comment the reviewer did
    # - +reviewer_name+ -> name of the reviewer
    # - +timestamp+ -> when was the comment submitted
    # * *Returns* :
    # - a mail object to be sent
    #
  def send_notification(email, comment, timestamp, page_name)
    @page_name  = page_name
    @comment = comment
    @timestamp = timestamp
        mail(to: email, subject: "Someone has commented on your page!")
  end

end
