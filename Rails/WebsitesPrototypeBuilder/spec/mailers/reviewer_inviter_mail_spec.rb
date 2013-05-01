require "spec_helper"

describe ReviewerInviter do
  it "send user password reset url" do
    ReviewerInviter.task_invitation("samy.shihata@yahoo.com", "asd", "www.google.com").deliver
  end
end


