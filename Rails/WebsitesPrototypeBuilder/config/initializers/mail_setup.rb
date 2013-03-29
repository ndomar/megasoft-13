ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "gmail.com",
	:user_name => "ssshihata@gmail.com",
	:password => "London3798",
	:authentication => :login,
	:enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp