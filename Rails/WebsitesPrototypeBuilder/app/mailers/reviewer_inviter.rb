class ReviewerInviter < ActionMailer::Base
  default from: "ssshihata@gmail.com"

  
  def task_invitation(email, msg, url)
  	@msg = msg
  	@url = url
  	m = mail(to: "samy.shihata@yahoo.com", subject: "Prototyper task invitation")
  	puts m.to_yaml
  	return m
  end

end
