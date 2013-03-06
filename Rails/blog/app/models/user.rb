class User < ActiveRecord::Base

	has_many :comments


	def self.authenticate(email="", login_password="")
		user = User.find_by_email(email)

		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end

	def match_password(login_password="")
		password == login_password
	end

end
