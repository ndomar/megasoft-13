class UserBlog < ActiveRecord::Base
  belongs_to :user

  has_many :blogposts
end
