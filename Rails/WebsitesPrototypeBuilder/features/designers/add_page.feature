Feature: Add pages to the project using package explorer
  As a registered designer of the website
  I want to add webpages to the project using the package explorer

      Given I am logged in
      and I selected a specific Project from my projects
      When I view the design page
      Then I should see a button in the side bar with a "+" sign and has text field beside it
     