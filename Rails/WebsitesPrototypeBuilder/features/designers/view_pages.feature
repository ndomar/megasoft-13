Feature: View Page
    In order to view a page
    A designer
    Should click the show content button in the design page

    Scenario: Views a Page
      	Given I am on a project's design page
     	When I press "Show content"
      	Then page's content should appear in the designing pane