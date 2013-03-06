class Blogpost < ActiveRecord::Base

	has_many :comments

	validates :title, :presence => true,
					  :length => {minimum: 5, maximum: 140}
	validates :content, :presence => true;
end
