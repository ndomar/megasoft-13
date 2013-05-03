# SMTP settings for ActionMailer to use 
ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "gmail.com",
	:user_name => "prototyper.v1@gmail.com",
	:password => "megasoft_13",
	:authentication => :login,
	:enable_starttls_auto => true
}

# Setting ActionMailer delivery method
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.default_url_options[:host] = "localhost:3000"