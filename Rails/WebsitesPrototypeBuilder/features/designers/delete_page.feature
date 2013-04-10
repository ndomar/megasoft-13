Feature: Delete pages from the project using package explorer
  As a registered designer of the website
  I want to delete webpages that I created from within the project using the package explorer

      Given I am logged in
      and I selected a specific Project from my projects
      When I view the design page
      Then I should see all the webpages included in the project with a delete buttons for each one of them