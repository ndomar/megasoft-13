require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "should not save comment without body" do
	  comment = Comment.new
	  assert !comment.save, "Saved the comment without a body"
	end
	
end