Feature: Add Empty Page Name
    In order to add a page
    A designer
    Should not be able to create pages with empty names

    Scenario: Add a Page
      	Given I am on a project's design page
     	When I dont enter data in the text box and press "Add"
      	Then page should refresh and no new page should be added