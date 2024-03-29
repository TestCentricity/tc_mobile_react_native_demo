@mobile @ios @android @regression @cart


Feature:  Shopping Cart
  In order to make purchases of SauceLabs swag
  As an end user of the SauceLabs My Demo app
  I want to purchase items that are in my Shopping Basket


  Background:
    Given I have launched the SauceLabs My Demo app
    And I am on the Products screen
    And the shopping cart is empty


  Scenario:  Verify product item set to quantity of zero is removed from cart
    Given I have added 1 product item to the shopping cart
    And I am on the Cart screen
    When I change the item quantity to 0
    Then the shopping cart should be empty

@bat
  Scenario:  Verify product item can be removed from cart
    Given I have added 1 product item to the shopping cart
    And I am on the Cart screen
    When I remove the item
    Then the shopping cart should be empty


  Scenario:  Verify product with one color option can be added to cart
    When I choose a product with one color option
    And I add the selected product to the cart
    Then I expect the selected product to be correctly displayed in the shopping cart

@bat
  Scenario:  Verify product with multiple color options can be added to cart
    When I choose a product with multiple color options
    And I select a color option
    And I select a quantity of 2
    And I add the selected product to the cart
    Then I expect the selected product to be correctly displayed in the shopping cart


  Scenario:  Verify that quantity can be changed of product item in cart
    Given I have added 1 product item to the shopping cart
    And I am on the Cart screen
    When I change the item quantity to 3
    Then I expect the cart quantity to be correctly displayed

@bat
  Scenario:  Verify anonymous user must login prior to checkout
    Given I have added 2 product items to the shopping cart
    And I am on the Cart screen
    When I choose to checkout
    Then I expect the Login screen to be correctly displayed


  Scenario:  Verify logged in user can proceed to checkout
    Given I have logged in a valid user
    And I have added 2 product items to the shopping cart
    And I am on the Cart screen
    When I choose to checkout
    Then I expect the Checkout - Address screen to be correctly displayed
