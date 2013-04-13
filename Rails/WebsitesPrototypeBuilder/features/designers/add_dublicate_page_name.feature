Feature: Add Dublicate Page
    In order to add a page
    A designer
    Should not be able to create pages with duplicate names

    Scenario: Add a Page
      	Given I am on a project's design page
     	When I enter a name in the textbox where this name already exists and press "Add"
      	Then page should refresh and no new page should be added