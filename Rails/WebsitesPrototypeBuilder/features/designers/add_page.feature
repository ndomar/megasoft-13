Feature: Add Page
    In order to add a page
    A designer
    Should click the add page button in the design page

    Scenario: Add a Page
      	Given I am on a project's design page
     	When I enter data in the textbox and press "Add"
      	Then page should refresh and the added page should appear in the sidebar