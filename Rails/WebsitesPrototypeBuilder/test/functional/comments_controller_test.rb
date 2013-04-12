require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "web_site_count" do
    assert_equal 2, Comment.count
  end

end