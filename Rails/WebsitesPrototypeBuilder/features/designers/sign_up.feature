Feature: Sign up
  In order to get access to protected sections of the site
  As a designer
  I want to be able to sign up

    Background:
      Given I am not logged in

    Scenario: Designer signs up with valid data
      When I sign up with valid designer data
      Then I should see a successful sign up message
      
    Scenario: Designer signs up with invalid email
      When I sign up with an invalid email
      Then I should see an invalid email message

    Scenario: Designer signs up without password
      When I sign up without a password
      Then I should see a missing password message

    Scenario: Designer signs up without password confirmation
      When I sign up without a password confirmation
      Then I should see a missing password confirmation message

    Scenario: Designer signs up with mismatched password and confirmation
      When I sign up with a mismatched password confirmation
      Then I should see a mismatched password message