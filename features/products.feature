@mobile @ios @android @regression @products


Feature:  Products
  In order to ensure proper management of product data
  As an end user of the SauceLabs My Demo app
  I expect to be able to view and sort items in the product list


  Background:
    Given I have launched the SauceLabs My Demo app
    And I am on the Products screen


  Scenario:  Verify sort menu can be invoked and is properly displayed
    When I open the sort menu
    Then I expect the sort menu to be correctly displayed


  Scenario Outline:  Verify sort menu can be invoked and is properly displayed
    When I sort the product list by <sort_mode>
    Then I expect the Products screen to be correctly displayed
    And I expect the sort menu to be correctly displayed

    Examples:
      |sort_mode        |
      |Name Descending  |
      |Price Ascending  |
      |Price Descending |
      |Name Ascending   |

@bat
  Scenario Outline:  Verify Product Item screen is accessible via products grid selection
    When I choose product item <product_id> in the products grid
    Then I expect the Product Item screen to be correctly displayed

    Examples:
      |product_id |
      |2          |
      |3          |
      |6          |


  Scenario Outline:  Verify Product Item screen displays color options correctly
    When I choose a product with <option> color options
    Then I expect the Product Item screen to be correctly displayed

    Examples:
      |option   |
      |multiple |
      |one      |


  Scenario:  Verify product item with quantity of zero cannot be added to cart
    When I choose a product with one color option
    And I select a quantity of 0
    Then I should not be able to add the selected product to the cart
