@mobile @ios @android @regression @drawing


Feature:  Drawing Screen
  In order to ensure comprehensive support for native app drawing features
  As an end user of the SauceLabs My Demo app
  I expect to validate that drawings can be saved to photo library


  Background:
    Given I have launched the SauceLabs My Demo app
    And I am on the Drawing screen


  Scenario:  Verify that blank drawing cannot be saved
    When I draw a triangle on the drawing pad
    And I choose to clear the drawing
    Then I should not be able to save the drawing


  Scenario:  Verify drawing can be saved to photo library
    When I draw a square on the drawing pad
    And I choose to save the drawing
    And I accept the popup request modal
    Then I expect the drawing to be saved
