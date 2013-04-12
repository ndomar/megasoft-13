#helper method for the unit test send notification

def expect_email(email)
  delivered = ActionMailer::Base.deliveries.last
  expected =  email.deliver

  delivered.multipart?.should == expected.multipart?
  delivered.headers.except("Message-Id").should == expected.headers.except("Message-Id")
end