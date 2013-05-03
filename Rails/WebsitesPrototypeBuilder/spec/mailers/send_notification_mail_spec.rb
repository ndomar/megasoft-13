require 'spec_helper'
 
describe SendNotification do
    let(:user) { mock_model(User, comment =>'comment', :email => 'lucas@email.com') }
    let(:mail) { Notifier.instructions(user) }
 
    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'Someone has commented on your page!'
    end
 
    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end
 
    #ensure that the @comment variable appears in the email body
    it 'assigns @comment' do
      mail.body.encoded.should match(user.comment)
    end
 
    
end