ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "gmail.com",
	:user_name => "prototyper.v1@gmail.com",
	:password => "megasoft_13",
	:authentication => :login,
	:enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
