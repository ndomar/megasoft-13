class Designer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:login]

validates :username, :uniqueness => true, :presence => true
validates :phone_number, :length => { :minimum => 8, :maximum => 11 } 
validates :phone_number,:day_dob,:month_dob,:year_dob, :credit_card_number, :cvv2, :numericality => { :only_integer => true }
validates :credit_card_number, :length => { :minimum => 12, :maximum => 19 }
validates :cvv2, :length => { :minimum => 3, :maximum => 4 }
validates :country, :presence => true
validates_numericality_of :day_dob, :greater_than_or_equal_to => 1 , :less_than_or_equal_to =>  31 
validates_numericality_of :month_dob,:greater_than_or_equal_to =>  1 , :less_than_or_equal_to =>  12 
validates_numericality_of :year_dob, :greater_than_or_equal_to =>  1900, :less_than_or_equal_to =>  2012
  
  #virtual attr accessor to sign in with email, username or facebook email
  attr_accessor :login
  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :password, :password_confirmation, :username, :phone_number, :country,:day_dob,:month_dob, :year_dob, :credit_card_number, :cvv2,:profession, :gender, :facebook_email, :remember_me

  #Override Devise method to log in with email, username or facebook email
	def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(facebook_email) = :value OR lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    where(conditions).first
	  end
	end
end
