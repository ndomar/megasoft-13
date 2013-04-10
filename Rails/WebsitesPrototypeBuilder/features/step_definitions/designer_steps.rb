### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :fullname => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme", 
    :phone_number => "01004509771", :country => "Egypt", :day_dob => 15,
    :month_dob => 10, :year_dob => 1990,
    :credit_card_number => 1234567891234567, :cvv2 => 123}
end

def find_designer
  @designer ||= Designer.where(:email => @visitor[:email]).first
end

def create_unconfirmed_designer
  create_visitor
  delete_designer
  sign_up
  #visit '/designers/sign_out'
end

def create_designer
  create_visitor
  delete_designer
  @designer = FactoryGirl.create(:designer, @visitor)
end

def delete_designer
  @designer ||= Designer.where(:email => @visitor[:email]).first
  @designer.destroy unless @designer.nil?
end

def sign_up
  delete_designer
  visit '/designers/sign_up'
  fill_in "designer_fullname", :with => @visitor[:fullname]
  fill_in "designer_email", :with => @visitor[:email]
  fill_in "designer_password", :with => @visitor[:password]
  fill_in "designer_password_confirmation", :with => @visitor[:password_confirmation]
  #click_button "Sign up"
  find_designer
end

def sign_in
  visit '/designers/sign_in'
  fill_in "designer_email", :with => @visitor[:email]
  fill_in "designer_password", :with => @visitor[:password]
  #click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  #visit '/designers/sign_out'
end

Given /^I am logged in$/ do
  create_designer
  sign_in
end

Given /^I exist as a designer$/ do
  create_designer
end

Given /^I do not exist as a designer$/ do
  create_visitor
  delete_designer
end

Given /^I exist as an unconfirmed designer$/ do
  create_unconfirmed_designer
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  #visit '/designers/sign_out'
end

When /^I sign up with valid designer data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  #click_link "Edit account"
  #fill_in "designer_fullname", :with => "newname"
  #fill_in "designer_current_password", :with => @visitor[:password]
  #click_button "Update"
end

When /^I look at the list of designers$/ do
  visit '/'
end

### THEN ###
Then /^I should be signed in$/ do
  #page.should have_content "Logout"
  #page.should_not have_content "Sign up"
  #page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  #page.should have_content "Sign up"
  #page.should have_content "Login"
  #page.should_not have_content "Logout"
end

Then /^I see an unconfirmed account message$/ do
  #page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  #page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  #page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  #page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  #page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  #page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  #page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  #page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  #page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  #page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  create_designer
  page.should have_content @designer[:fullname]
end

#########################################################
#Hossam's Tests

#This is so wrong!!!
def delete_page
  @page ||= Page.where(:id => @given_page[:id])
  @page.destroy unless @page.nil?
end


### GIVEN ###

##<<<<-------------------------------------
Given /^I selected a specific project$/ do
  #click_link "project name"  <<<<------------This is dynamic so i cant specify a certain name
end

### WHEN ###
When /^I view the design page$/ do
  
end

### THEN ###
Then /^I should see all the webpages included in the project$/ do
  #page.should have_content "صفحات"
end

Then /^I should see all the webpages included in the project with delete buttons for each one of them$/ do
  #page.should not have_content "page name"
end
#<<------------------ should i state that or what is after deleting
