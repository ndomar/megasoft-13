require 'test_helper'

class TaskControllerTest < ActionController::TestCase
  test "should get invite" do
    get :invite
    assert_response :success
  end

end
