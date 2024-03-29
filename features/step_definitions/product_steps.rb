

When(/^I access the data for product id (.*)$/) do |product_id|
  product_data_source.find_product(product_id)
end


When(/^I choose product item (.*) in the products grid$/) do |product_id|
  products_screen.choose_product_item(product_id)
end


Then(/^the shopping cart is (.*)$/) do |state|
  case state.downcase.to_sym
  when :full, :populated
    quantity = Environ.is_ios? ? 3 : 2
    cart_data_source.load_cart(quantity)
  when :empty
    CartData.current = nil
    base_app_screen.clear_app_data
  else
    raise "#{state} is not a valid selector"
  end
end


When(/^I open the sort menu$/) do
  products_screen.invoke_sort_menu
end


Then(/^I expect the sort menu to be correctly displayed$/) do
  products_screen.verify_sort_menu
end


When(/^I sort the product list by (.*)$/) do |sort_mode|
  products_screen.sort_by(sort_mode)
end


When(/^I choose a product with (.*) color options?$/) do |option|
  product_id = case option.downcase.to_sym
               when :multiple
                 %w[1 5 6].sample
               when :one
                 %w[2 3 4].sample
               end
  products_screen.choose_product_item(product_id)
  product_item_screen.verify_screen_exists
end


When(/^I select a color option$/) do
  colors = ProductData.current.colors
  colors.delete(ProductData.current.default_color)
  product_item_screen.select_color(colors.sample)
end


When(/^I select a quantity of (\d+)$/) do |qty|
  product_item_screen.select_quantity(qty)
end


When(/^I add the selected product to the cart$/) do
  product_item_screen.add_to_cart
end


Then(/^I expect the cart quantity to be correctly displayed$/) do
  ProductData.current.chosen_color = ProductData.current.default_color if ProductData.current.chosen_color.nil?
  CartData.current.total_price = ProductData.current.price * ProductData.current.quantity
  CartData.current.cart_items = "#{ProductData.current.quantity} - #{ProductData.current.name} - $#{ProductData.current.price} - #{ProductData.current.chosen_color}"
  cart_screen.verify_screen_ui
end


Then(/^I expect the selected product to be correctly displayed in the shopping cart$/) do
  cart_screen.load_screen
  cart_screen.verify_screen_ui
end


Then(/^I should not be able to add the selected product to the cart$/) do
  product_item_screen.verify_screen_ui
end


Given(/^I have added (\d+) product items? to the shopping cart$/) do |qty|
  cart_data_source.load_cart(qty)
  ids = CartData.current.product_ids
  product_data_source.find_product(ids.last)
end


When(/^I change the item quantity to (\d+)$/) do |qty|
  cart_screen.select_quantity(qty)
end


When(/^I remove the item$/) do
  cart_screen.remove_item
end


Then(/^the shopping cart should be empty$/) do
  cart_screen.verify_screen_ui
end


When(/^I choose to checkout$/) do
  cart_screen.checkout
end
