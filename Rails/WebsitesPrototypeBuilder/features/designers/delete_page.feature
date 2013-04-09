Feature: Delete pages from the project using package explorer
  As a registered designer of the website
  I want to delete webpages that I created from within the project using the package explorer

      Given I am logged in
      and I selected a specific Project from my projects
      When I view the design page
      Then I should see all the webpages included in the project 
      located in the sidebar in the right of the screen with a delete button associated to each
      one of them, then when i click on any of these buttons, the page is deleted and no more visible
      in the side bar in the right of the screen