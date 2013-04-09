##
# The designer model used as our main user type management
# * *Attribute* :
# - +email+ -> string
# - +password+ -> encrypted string
# - +fullname+ -> string
# - +facebook_email+ -> string
# - +phone_number+ -> string
# - +country+ -> string
# - +day_dob+ -> integer day of date of birth
# - +month_dob+ -> integer month of date of birth
# - +year_dob+ -> integer year of date of birth
# - +credit_card_number+ -> integer
# - +cvv2+ -> string
# - +profession+ -> string
# - +gender+ -> string
# - +rpx_identifier+ -> string used to log in with facebook
#* *Relations* :
# 
#
class Designer < ActiveRecord::Base

  has_many :projects

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :rpx_connectable tells devise to connect rpx with designer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :rpx_connectable,
         :validatable

  #Registration attributes and validations
  validates :fullname, :presence => true
  validates :phone_number, :length => { :minimum => 8, :maximum => 11 } , :numericality => { :only_integer => true }
  validates :day_dob,:month_dob,:year_dob, :credit_card_number, :cvv2, :numericality => { :only_integer => true }
  validates :credit_card_number, :length => { :minimum => 12, :maximum => 19 }
  validates :cvv2, :length => { :minimum => 3, :maximum => 4 }
  validates :country, :presence => true
  validates_numericality_of :day_dob, :greater_than_or_equal_to => 1 , :less_than_or_equal_to =>  31 
  validates_numericality_of :month_dob,:greater_than_or_equal_to =>  1 , :less_than_or_equal_to =>  12 
  validates_numericality_of :year_dob, :greater_than_or_equal_to =>  1900, :less_than_or_equal_to =>  2012

  # Setup accessible (or protected) attributes for your model

  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :fullname,
    :phone_number, :country,:day_dob,:month_dob, :year_dob, :credit_card_number,
    :cvv2,:profession, :gender, :facebook_email, :remember_me, :rpx_identifier

  # {"identifier"=>"http://www.facebook.com/profile.php?id=624556624", 
  # "email"=>"offa_4@hotmail.com", "username"=>"AhmadAdelRoshdySoliman", 
  # "name"=>"Ahmad Adel Roshdy Soliman", "extended"=>{"limited_data"=>"false"}}

  # Called before a successfull facebook log in
  def before_rpx_success(rpx_user)
    # Do something with rpx_user
  end
  
  # Called before a successfull first time facebook log in (authentication)
  def before_rpx_auto_create(rpx_user)
    # Do something with rpx_user
  end

end