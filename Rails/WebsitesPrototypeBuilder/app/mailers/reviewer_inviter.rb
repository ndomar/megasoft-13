class ReviewerInviter < ActionMailer::Base
  default from: "Prototyper"

  def task_invitation(email, msg, url)
    #Creatse a mail to a recipient with (email), and content containing (msg) and link (url)
  	@msg = msg
  	@url = url
  	m = mail(to: email, subject: "Prototyper task invitation")
  	puts m.to_yaml
  	return m
  end

end
