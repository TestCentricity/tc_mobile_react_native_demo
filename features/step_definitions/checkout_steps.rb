

Given(/^I have chosen to checkout with (\d+) product items? in my shopping cart$/) do |qty|
  cart_data_source.load_cart(qty)
  ids = CartData.current.product_ids
  product_data_source.find_product(ids.last)

  CartData.current.cart_items_deep_link = nil if [:checkout_step_1, :checkout_step_2, :checkout_step_3].include?(Environ.portal_state)
  cart_screen.load_screen
  cart_screen.checkout
  Environ.portal_state = :checkout_step_1 unless [:checkout_step_2, :checkout_step_3].include?(Environ.portal_state)
  checkout_address_screen.verify_screen_exists
end


Given(/^I have entered my payment data$/) do
  if Environ.portal_state == :checkout_step_3
    checkout_review_screen.load_screen
  else
    checkout_payment_screen.load_screen
    checkout_payment_screen.enter_data
    checkout_review_screen.verify_screen_exists
    Environ.portal_state = :checkout_step_3
  end

end


When(/^I enter my address data$/) do
  checkout_address_screen.enter_data
end


When(/^I enter my address data with (.*)$/) do |reason|
  user_data_source.find_user(reason.gsub(/\s+/, '_').downcase)
  checkout_address_screen.enter_data
end


When(/^I enter my payment data$/) do
  checkout_payment_screen.enter_data
end


When(/^I enter my billing address$/) do
  user_data_source.find_user('valid_billing_data')
  checkout_payment_screen.enter_data
end


When(/^I enter my payment data with (.*)$/) do |reason|
  user_data_source.find_user(reason.gsub(/\s+/, '_').downcase)
  checkout_payment_screen.enter_data
end


When(/^I have entered my shipping address data$/) do
  if Environ.portal_state == :checkout_step_2
    checkout_payment_screen.load_screen
  else
    checkout_address_screen.load_screen
    checkout_address_screen.enter_data
    checkout_payment_screen.verify_screen_exists
    Environ.portal_state = :checkout_step_2
  end
end


When(/^I choose to place my order$/) do
  checkout_review_screen.place_order
end
