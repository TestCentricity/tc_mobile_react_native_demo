@mobile @ios @android @regression @login


Feature:  Login Screen
  In order to ensure the security of critical business and customer data
  As an end user of the SauceLabs My Demo app
  I expect to access the app only with valid login credentials


  Background:
    Given I have launched the SauceLabs My Demo app
    And I am on the Login screen


  Scenario Outline:  Verify correct error states when using invalid credentials
    When I enter user credentials with <reason>
    Then I expect an error to be displayed due to <reason>

    Examples:
      |reason         |
      |no username    |
      |no password    |
      |locked account |
      |invalid user   |

@bat
  Scenario:  Verify login with valid credentials
    When I enter user credentials with valid data
    Then I expect the Checkout - Address screen to be correctly displayed
