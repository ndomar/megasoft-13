Feature: Save Page
    In order to save a page
    A designer
    Should click the Save content button in the design page

    Scenario: Saves a Page
      	Given I am on a project's design page
     	When I press "Save content"
      	Then page's content should be updated to what is in the design page