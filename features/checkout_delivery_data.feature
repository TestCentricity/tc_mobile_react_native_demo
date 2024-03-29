@mobile @ios @android @regression @checkout


Feature:  Checkout - Delivery Address
  In order to make purchases of SauceLabs swag
  As an end user of the SauceLabs My Demo app
  I expect to be able to enter my shipping address during checkout


  Background:
    Given I am logged in to the SauceLabs My Demo app
    And I have chosen to checkout with 2 product items in my shopping cart


  Scenario Outline:  Verify correct error states when entering incomplete shipping data
    When I enter my address data with <reason>
    Then I expect an error to be displayed due to <reason>

    Examples:
      |reason               |
      |no full name         |
      |no delivery address  |
      |no delivery city     |
      |no delivery zip code |
      |no delivery country  |

@bat
  Scenario:  Entry of valid shipping data provides access to Payment screen
    When I enter my address data
    Then I expect the Checkout - Payment screen to be correctly displayed
