class Question < ActiveRecord::Base
  attr_accessible :body, :page_id , :reviewer
  belongs_to :page
    validates :body, :presence => true
end
