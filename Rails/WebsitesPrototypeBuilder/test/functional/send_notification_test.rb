require 'test_helper'
 
class SendNotificationTest < ActionMailer::TestCase
  tests SendNotification
  test "send notification" do
    @expected.reviewer_email    = 'marwanelderwy@gmail.com'
    @expected.designer_email    = 'derwy_93@hotmail.com'
   # @expected.subject = "You have been invited by #{@expected.from}"
   # @expected.body    = read_fixture('notification')
    @expected.timestamp    = Time.now
    @expected.comment    = 'comment created'
 
    assert_equal @expected.encoded, ReviewerInviter.create_invite('marwanelderwy@gmail.com', 'derwy_93@hotmail.com', @expected.timestamp , @expected.comment).encoded
  end
 
end