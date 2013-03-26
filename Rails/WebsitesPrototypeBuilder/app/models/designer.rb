class Designer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates :username, :uniqueness => true, :presence => true
validates :phone_number, :length => { :minimum => 8 }
validates :phone_number, :length => { :maximum => 10 }
validates :phone_number,:day_dob,:month_dob,:year_dob, :numericality => { :only_integer => true }
validates :country, :presence => true
validates_numericality_of :day_dob, :greater_than_or_equal_to => 1 , :less_than_or_equal_to =>  31 
validates_numericality_of :month_dob,:greater_than_or_equal_to =>  1 , :less_than_or_equal_to =>  12 
validates_numericality_of :year_dob, :greater_than_or_equal_to =>  1900, :less_than_or_equal_to =>  2012
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username, :phone_number, :country,:day_dob,:month_dob, :year_dob,  :remember_me
  # attr_accessible :title, :body
end
