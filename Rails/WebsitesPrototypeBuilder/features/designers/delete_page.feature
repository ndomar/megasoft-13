Feature: Delete Page
    In order to delete a page
    A designer
    Should click the delete page link in the design page

    Scenario: Deletes a Page
      	Given I am on a project's design page
     	When I press "Delete"
      	Then page should refresh and the deleted page should no more be available in the sidebar