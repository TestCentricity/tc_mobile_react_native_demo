@mobile @ios @android @regression @checkout


Feature:  Checkout - Payment Method
  In order to make purchases of SauceLabs swag
  As an end user of the SauceLabs My Demo app
  I expect to be able to enter my payment data during checkout


  Background:
    Given I am logged in to the SauceLabs My Demo app
    And I have chosen to checkout with 1 product item in my shopping cart
    And I have entered my shipping address data


  Scenario Outline:  Verify correct error states when entering incomplete payment data
    When I enter my payment data with <reason>
    Then I expect an error to be displayed due to <reason>

    Examples:
      |reason              |
      |no cardholder name  |
      |no card number      |
      |no expiration       |
      |no cvv              |
      |no billing name     |
      |no billing address  |
      |no billing city     |
      |no billing zip code |
      |no billing country  |


  Scenario:  Entry of valid payment data provides access to Checkout Review screen
    Given I am on the Checkout - Payment screen
    When I enter my payment data
    Then I expect the Checkout - Review screen to be correctly displayed

@bat
  Scenario:  Entry of valid billing address provides access to Checkout Review screen
    Given I am on the Checkout - Payment screen
    When I enter my billing address
    Then I expect the Checkout - Review screen to be correctly displayed

@bat
  Scenario:  Verify order can be placed once shipping and payment data have been provided
    Given I have entered my payment data
    When I choose to place my order
    Then I expect the Checkout - Complete screen to be correctly displayed
