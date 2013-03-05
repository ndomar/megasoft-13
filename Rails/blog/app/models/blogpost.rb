class Blogpost < ActiveRecord::Base
	validates :title, :presence => true,
					  :length => {minimum: 5, maximum: 140}
	validates :content, :presence => true;
end
