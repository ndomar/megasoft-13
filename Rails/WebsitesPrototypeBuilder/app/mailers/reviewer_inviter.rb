##
# ActionMailer to send invitations by email
# * *Attribute*    :
# * *Attribute* :
# - +from+ -> the sender email added to the header
#* *Relations* :
# - none
#
class ReviewerInviter < ActionMailer::Base
  default from: "Prototyper"
  default :from => "Prototyper"

    ##
    # sends a mail to the specified email, carrying
    # a custom invitation to a task
    # * *Args* :
    # - +email+ -> the email to send to
    # - +msg+ -> a custom message for the invitation
    # - +url+ -> url for the task to be taken
    # * *Returns* :
    # - a mail object to be sent
    #
  def task_invitation(email, msg, url)
    @msg = msg
  	@url = url
  	mail(to: email, subject: "Prototyper task invitation")
  end
    ##
    # sends a mail to the designer
    # * *Args*     :
    # - +email+ -> the email to send to
    # - +comment+ -> the comment the reviewer did
    # - +reviewer_name+ -> name of the reviewer
    # - +timestamp+ -> when was the comment submitted
    # * *Returns* :
    # - a mail object to be sent
    #
  def send_notification(email, comment, reviewer_email, timestamp)
    @comment = comment
    @timestamp = timestamp
    @reviewer_email = reviewer_email
    mail(to: email, subject: "Someone has commented on your page!")
  end
    ##
    # sends a mail to the designer
    # * *Args*    :
    # - +url+ -> url of the page to take screenshot
    # * *Returns* :
    # - a screenshot to be taken
    #
  def take_screenshot(url)
    require 'selenium-webdriver'
    width = 1024
    height = 728
     driver = Selenium::WebDriver.for :firefox
     #driver = Selenium::WebDriver.for :chrome
    driver.navigate.to @url
    driver.execute_script Q{
    window.resizeTo(200, 100);
 }
  driver.save_screenshot('C:\Users\Derwy\Documents\GitHub\megasoft-13\Rails\WebsitesPrototypeBuilder\screenshots')

  driver.quit

    @url = url
    mail(:to => email, :subject => "Prototyper task invitation")
  end
end
