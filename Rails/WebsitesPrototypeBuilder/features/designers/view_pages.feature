Feature: View project pages in package explorer
  As a registered designer of the website
  I should be able to view my created webpages within a Project 

    Scenario: I sign in then select one of my projects
      Given I am logged in
      and I selected a specific Project from my projects
      When I view the design page
      Then I should see all the webpages included in the project located in the sidebar in the right of the screen