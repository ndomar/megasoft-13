class ReviewerInviter < ActionMailer::Base
  default from: "ssshihata@gmail.com"

  def task_invitation(email, msg, url)
    #Creates a mail to a recipient with (email), and content containing (msg) and link (url)
  	@msg = msg
  	@url = url
  	m = mail(to: email, subject: "Prototyper task invitation")
  	puts m.to_yaml
  	return m
  end

end
