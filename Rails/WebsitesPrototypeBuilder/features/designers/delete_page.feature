Feature: Delete pages from the project using package explorer
  As a registered designer of the website
  I should be able to delete any of my created webpages within a Project

      Given I am logged in
      And I selected a specific Project from my projects
      When I view the design page
      Then I should see all the webpages included in the project with a delete buttons for each one of them