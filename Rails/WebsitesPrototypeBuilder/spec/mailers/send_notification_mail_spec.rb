require 'spec_helper'
 
describe SendNotifica do
  describe 'notification' do
    let(:user) { mock_model(User, comment =>'comment', :email => 'lucas@email.com') }
    let(:mail) { Notifier.instructions(user) }
 
    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'notification'
    end
 
    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end
 
    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == ['prototyper.v1@gmail.com']
    end
 
    #ensure that the @name variable appears in the email body
    it 'assigns @comment' do
      mail.body.encoded.should match(user.comment)
    end
 
    
  end
end