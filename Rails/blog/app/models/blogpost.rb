class Blogpost < ActiveRecord::Base
  belongs_to :user_blog

 	has_many :comments


	validates :title, :presence => true,
					  :length => {minimum: 5, maximum: 140}
	validates :content, :presence => true;
end
