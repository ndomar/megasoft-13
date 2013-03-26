class Designer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates :username, :uniqueness => true, :presence => true
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username, :remember_me
  # attr_accessible :title, :body
end
